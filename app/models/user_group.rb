class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group

  # グループに同一人物が2人以上登録されないように
  validates :user_id, uniqueness: { scope: :group_id }
end
