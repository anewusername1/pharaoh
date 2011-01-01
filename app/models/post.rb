class Post
  include Mongoid::Document
  
  field :subtext
  field :text
  field :email
  field :approved
  field :visible, :type => Boolean, :default => false
  embeds_many :comments
end