require 'rails_helper'

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
