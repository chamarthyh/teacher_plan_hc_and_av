require 'rails_helper'

RSpec.describe Coach, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:plans_to_coaches) }

    end

    describe "InDirect Associations" do

    it { should have_many(:plans) }

    end

    describe "Validations" do
      
    end
end
