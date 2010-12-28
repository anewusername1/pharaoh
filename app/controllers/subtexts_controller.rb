class SubtextsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @subtext = Subtext.new
  end
  
  def create
    Subtext.create(params[:subtext])
  end
  
  def index
    @subtexts = Subtext.all
    redirect_to user_index_path unless(can? :manage, @subtexts)
  end
end