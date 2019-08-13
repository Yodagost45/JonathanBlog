class User < ApplicationRecord
  has_many :goal_sections, dependent: :delete_all
  accepts_nested_attributes_for :goal_sections, allow_destroy: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
