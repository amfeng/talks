class Post < ActiveRecord::Base
  belongs_to :user

  def add_comment
    # FIXME: Now You Try, adding comment for this post
  end

  def delete_comment
    # FIXME: Now You Try, deleting comment for this post
  end
end
