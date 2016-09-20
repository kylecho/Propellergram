module RelationshipsHelper
  def current_user_is_following(current_user_id, target_user_id)
    return Follow.where(following_id: target_user_id, follower_id: current_user_id).exists?
  end
end
