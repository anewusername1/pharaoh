class SubtextsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @subtext = Subtext.new
  end
  
  def create
    Subtext.create(params[:subtext])
  end
end