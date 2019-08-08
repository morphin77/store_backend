require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#name' do
    it { should validate_presence_of(:name) }
  end

  describe '#surname' do
    it { should validate_presence_of(:surname) }
  end

  describe '#nickname' do
    it { should validate_presence_of(:nickname) }
  end

  describe '#email' do
    it { should validate_presence_of(:email) }
  end

  describe '#email' do
    it { should_not allow_value("blah").for(:email) }
    it { should allow_value("a@b.com").for(:email) }
  end

end
