require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(
        name: "Oleg",
        username: "Kulakov",
        email: "test@test.test",
        password: "12345678",
        password_confirmation: "12345678"
    )
  end

  it "should be valid" do
    expect(@user).to be_valid
  end
end
