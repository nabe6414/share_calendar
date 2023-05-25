class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_groups, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :plans
  # ユーザーが所属しているグループを取得
  has_many :belong_groups, through: :user_groups, source: :group

  validates :name, presence: true
end
