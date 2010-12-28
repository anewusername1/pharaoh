class Post
  include Mongoid::Document
  
  field :subtext
  field :text
  embeds_many :comments
end