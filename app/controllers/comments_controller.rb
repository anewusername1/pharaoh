class CommentsController < ApplicationController
  before_filter :authenticate_user!
  expose(:comment)
end
