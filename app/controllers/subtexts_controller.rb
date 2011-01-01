class SubtextsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @subtext = Subtext.new
  end
  
  def create
    Subtext.create(params[:subtext])
    redirect_to subtexts_url
  end
  
  def index
    @subtexts = Subtext.all
    redirect_to user_index_path unless(can? :manage, @subtexts)
  end
  
  def destroy
    subtext = Subtext.criteria.id(params[:id]).first
    unless(subtext.blank?)
      subtext.delete
    else
      flash[:error] = "Could not find subtext"
    end
    redirect_to subtexts_url
  end
end