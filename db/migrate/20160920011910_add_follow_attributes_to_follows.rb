class AddFollowAttributesToFollows < ActiveRecord::Migration[5.0]
  def change
    add_column :follows, :following_id, :integer, :null => false
    add_column :follows, :follower_id, :integer, :null => false

    add_index :follows, :following_id
    add_index :follows, :follower_id
    add_index :follows, [:following_id, :follower_id], unique: true
  end
end
