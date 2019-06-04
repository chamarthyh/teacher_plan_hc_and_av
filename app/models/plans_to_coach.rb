class PlansToCoach < ApplicationRecord
  # Direct associations

  belongs_to :plan

  belongs_to :coach

  # Indirect associations

  # Validations

end
