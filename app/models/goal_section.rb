class GoalSection < ApplicationRecord
  belongs_to :user
  has_many :goals, dependent: :delete_all
  accepts_nested_attributes_for :goals, allow_destroy: true
end