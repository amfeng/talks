class User < ActiveRecord::Base
  acts_as_authentic

  has_many :friendships,
    :dependent => :destroy
  has_many :friends,
    :through   => :friendships
  has_many :posts

  # FIXME: Security and validations

  def add_friend(friend)
    raise ArgumentError unless friend
    raise ArgumentError.new("Already friended") if friends.include? friend

    f = Friendship.new :user_id => self.id, :friend_id => friend.id
    return f.save
  end

  def unfriend(friend)
    raise ArgumentError unless friend
    raise ArgumentError.new("Not a friend") unless friends.include? friend

    f = Friendship.find_by_user_id_and_friend_id( self.id, friend.id )
    return f.destroy
  end

end
