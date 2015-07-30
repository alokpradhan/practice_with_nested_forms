class Post < ActiveRecord::Base
  has_many :user_posts
  has_many :authors, :source => :user, :through => :user_posts
  has_many :post_taggings
  has_many :tags_on_authored_posts, :source => :tag, :through => :post_taggings
  has_many :child_comments, 
           :class_name => "Comment" , 
           :dependent => :destroy

  accepts_nested_attributes_for :child_comments

end
