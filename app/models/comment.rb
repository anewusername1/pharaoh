class Comment
  include Mongoid::Document
  
  field :text
  field :user
  embedded_in :post, :inverse_of => :comments
end