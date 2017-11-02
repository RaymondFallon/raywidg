class CreateWidgets < ActiveRecord::Migration[5.1]
  def change
    create_table :widgets do |t|
      t.string :email
      t.integer :quantity
      t.string :color
      t.date :due_by
      t.string :w_type
      t.string :status

      t.timestamps
    end
  end
end
