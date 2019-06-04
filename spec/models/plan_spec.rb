require 'rails_helper'

RSpec.describe Plan, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:plans_to_coaches) }

    it { should have_many(:goals) }

    it { should belong_to(:teacher) }

    end

    describe "InDirect Associations" do

    it { should have_many(:coaches) }

    end

    describe "Validations" do
      
    end
end
