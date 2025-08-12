class CreateSpofs < ActiveRecord::Migration[8.0]
  def change
    create_table :spofs do |t|
      t.string :name
      t.text :label

      t.timestamps
    end
  end
end
