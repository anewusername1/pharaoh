class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  validates_length_of :text, :minimum => 2, :maximum => 200
  
  field :subtext
  field :text
  field :email
  field :approved
  field :visible, :type => Boolean, :default => false
  embeds_many :comments
end