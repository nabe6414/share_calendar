class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.integer :user_id, null: false
      t.integer :group_id, null: false
      t.string :title
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
