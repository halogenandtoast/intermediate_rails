class CreateReshouts < ActiveRecord::Migration
  def change
    create_table :reshouts do |t|
      t.belongs_to :shout, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :reshouts, :shouts
  end
end
