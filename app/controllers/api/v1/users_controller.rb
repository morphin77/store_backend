module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorize_request, except: :create
      before_action :find_user, except: %i[create index]

      # GET /api/v1/users
      def index
        render json: User.all, status: :ok
      end

      # GET /api/v1/users/{nickname}
      def show
        render json: @user, status: :ok
      end

      # POST /api/v1/users
      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      # PUT /api/v1/users/{nickname}
      def update
        unless @user.update(user_params)
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/users/{nickname}
      def destroy
        @user.destroy
      end

      private

      def find_user
        @user = User.find_by_nickname!(params[:nickname])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
      end

      def user_params
        params.permit(
            :name, :surname, :nickname, :email, :password, :password_confirmation
        )
      end
    end
  end
end

