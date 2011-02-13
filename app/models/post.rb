class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  validates_length_of :text, :minimum => 2, :maximum => 200
  
  field :subtext
  field :text
  field :email
  field :deny_message
  field :approved, :type => Boolean, :default => false
  field :visible, :type => Boolean, :default => false
  embeds_many :comments

  scope :activisible, lambda { where(:approved => true, :visible => true).order_by(:created_at.desc) }
end
