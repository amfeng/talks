class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User'

  after_create :create_inverse

  # For every user, friends must be unique
  validates_uniqueness_of :friend_id, :scope => :user_id

private

  # If this friendship has
  #   +:user => a, :friend => b+,
  # ensures the existence of a {Friendship} with
  #   +:user => b, :friend => a+
  #
  def create_inverse
    Friendship.find_or_create_by_user_id_and_friend_id(friend_id, user_id)
  end

end
