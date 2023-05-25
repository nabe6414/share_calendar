class Group < ApplicationRecord
  has_many :user_groups, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :plans, dependent: :destroy
  belongs_to :user
  # グループに所属するユーザーを取得
  has_many :users, through: :user_groups, source: :user


  validates :name, presence: true
end
