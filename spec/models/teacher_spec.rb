require 'rails_helper'

RSpec.describe Teacher, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:plans) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
