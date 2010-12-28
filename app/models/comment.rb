class Comment
  include Mongoid::Document
  
  field :text
  field :user
  belongs_to :post, :inverse_of => :comments
end