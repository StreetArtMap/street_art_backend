require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_presence_of :email }
  end

  describe 'relationships' do
    it { should have_many :street_arts }
  end
end
