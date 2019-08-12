require 'rails_helper'
#ToDo: add test for default scope
RSpec.describe User, type: :model do

  describe '#name persence' do
    it { should validate_presence_of(:name) }
  end

  describe '#surname persence' do
    it { should validate_presence_of(:surname) }
  end

  describe '#nickname persence' do
    it { should validate_presence_of(:nickname) }
  end

  describe '#email persence' do
    it { should validate_presence_of(:email) }
  end

  describe '#email is valid' do
    it { should_not allow_value("blah").for(:email) }
    it { should allow_value("a@b.com").for(:email) }
  end

  describe '#email is valid' do
    it { should_not allow_value("blah").for(:email) }
    it { should allow_value("a@b.com").for(:email) }
  end


  describe 'email unique' do
    before('@check_email_unique') do
      User.create(name: "test",
                  surname: "test",
                  nickname: "test",
                  email: "test@test.test",
                  password: "test_password",
                  password_confirmation: "test_password"
      )
    end

    after('@check_email_unique') do
      User.delete_all
    end

    it 'email must be unique', :check_email_unique => true do
      user = User.create(name: "test",
                         surname: "test",
                         nickname: "test1",
                         email: "test@test.test",
                         password: "test_password",
                         password_confirmation: "test_password"
      )

      expect(user.errors.empty?).to be_falsey
    end
  end

  describe 'nickname unique' do
    before('@check_nickname_unique') do
      User.create(name: "test",
                  surname: "test",
                  nickname: "test",
                  email: "test@test.test",
                  password: "test_password",
                  password_confirmation: "test_password"
      )
    end

    after('@check_nickname_unique') do
      User.delete_all
    end

    it 'nickname must be unique', :check_nickname_unique => true do
      user = User.create(name: "test",
                         surname: "test",
                         nickname: "test",
                         email: "test2@test.test",
                         password: "test_password",
                         password_confirmation: "test_password"
      )

      expect(user.errors.empty?).to be_falsey
    end
  end

  describe 'password length' do
    it 'check password length' do
      user = User.create(name: "test",
                         surname: "test",
                         nickname: "test",
                         email: "test2@test.test",
                         password: "test",
                         password_confirmation: "test_password"
      )

      expect(user.errors.empty?).to be_falsey
    end

  end

  describe 'user default scope' do
    before('@check_user_default_scope') do
      User.create(name: "test",
                  surname: "test",
                  nickname: "test",
                  email: "test@test.test",
                  password: "test_password",
                  password_confirmation: "test_password"
      )
    end

    it 'user return parameters', :check_user_default_scope => true do
      user = User.first

      expect(user).to have_attributes(
                          name: "test",
                          surname: "test",
                          nickname: "test",
                          email: "test@test.test"
                      )
    end

    it 'user not return id', :check_user_default_scope => true do
      user = User.first

      expect(user).not_to have_attribute(:id)
    end

    it 'user not return password_digest', :check_user_default_scope => true do
      user = User.first

      expect(user).not_to have_attribute(:password_digest)
    end
  end

end
