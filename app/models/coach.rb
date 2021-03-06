class Coach < ApplicationRecord
  # Direct associations

  has_many   :plans_to_coaches,
             :dependent => :destroy

  # Indirect associations

  has_many   :plans,
             :through => :plans_to_coaches,
             :source => :plan

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
