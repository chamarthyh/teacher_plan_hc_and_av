class Plan < ApplicationRecord
  # Direct associations

  has_many   :plans_to_coaches,
             :dependent => :destroy

  has_many   :goals,
             :dependent => :destroy

  belongs_to :teacher

  # Indirect associations

  has_many   :coaches,
             :through => :plans_to_coaches,
             :source => :coach

  # Validations

end
