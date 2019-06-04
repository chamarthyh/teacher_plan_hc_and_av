class Plan < ApplicationRecord
  # Direct associations

  has_many   :goals,
             :dependent => :destroy

  belongs_to :teacher

  # Indirect associations

  # Validations

end
