class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.integer :owner_id, null: false
      t.integer :user_id, null: false
      t.integer :group_id, null: false
      t.boolean :approved, null: false, default: false

      t.timestamps
    end
  end
end
