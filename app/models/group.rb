class Group < ApplicationRecord
  has_many :user_groups, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :plans, dependent: :destroy
  
  validates :name, presence: true
end
