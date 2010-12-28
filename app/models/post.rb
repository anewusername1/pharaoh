class Post
  include Mongoid::Document
  
  field :subtext
  field :text
  has_many :comments
end