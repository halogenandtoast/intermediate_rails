class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.string :body, null: false
      t.belongs_to :user, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :shouts, :users
  end
end
