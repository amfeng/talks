class User < ActiveRecord::Base
  acts_as_authentic

  has_many :friendships
  has_many :friends,
    :through   => :friendships,
    :dependent => :destroy
end
