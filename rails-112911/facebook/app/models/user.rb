class User < ActiveRecord::Base
  acts_as_authentic

  has_many :friendships,
    :dependent => :destroy
  has_many :friends,
    :through   => :friendships

  attr_accessible :email, :password, :password_confirmation
end
