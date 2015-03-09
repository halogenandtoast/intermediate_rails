class CreateFollowingRelationships < ActiveRecord::Migration
  def change
    create_table :following_relationships do |t|
      t.belongs_to :follower, index: true, null: false
      t.belongs_to :followed_user, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :following_relationships, :users, column: :follower_id
    add_foreign_key :following_relationships, :users, column: :followed_user_id
  end
end
