class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User'

  after_create  :create_inverse
  after_destroy :destroy_inverse

  # For every user, friends must be unique
  validates_uniqueness_of :friend_id, :scope => :user_id

  # @return [Friendship] where +user_id+ and +friend_id+ are swapped
  #
  def inverse
    @inverse ||= Friendship.find_by_friend_id_and_user_id(user_id, friend_id)
  end

private

  # Creates the inverse {Friendship} if it does not exist
  # @return [Friendship] inverse
  #
  def create_inverse
    inverse or @inverse = Friendship.create( :user_id => friend_id, :friend_id => user_id)
  end

  def destroy_inverse
    inverse.destroy if inverse
    @inverse = nil
  end

end
