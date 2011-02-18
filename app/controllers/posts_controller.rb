class PostsController < ApplicationController
  expose(:posts)
  expose(:post)
  
  expose(:active_posts) do
    Post.activisible
  end

  expose(:post_subtexts) do
    Subtext.all.collect {|s| [s.subtext, s._id]}
  end
  # def index
  #   @posts = Post.find(:all, :conditions => {:approved => true, :visible => true}).order_by(:created_at.desc)
  # end
  
  # def show
  #   @posts = Post.find(:id => params[:id])
  # end
  
  def destroy
    if(can?(:manage, :posts))
      post = Post.criteria.id(params[:id]).first
      post.delete
      redirect_to '/posts/manage'
    else
      redirect_to root_path
    end
  end
  
  def unapproved
    @unapproved_posts = Post.unapproved
    @approved_posts = Post.approved
    if(current_user)
      redirect_to user_path(current_user) unless(can?(:manage, @posts))
    else
      redirect_to root_path
    end
  end
  
  def manage
    if(current_user)
      post = Post.criteria.id(params[:id]).first
      if(can?(:manage, post))
        if(params[:paction] == "approve")
          flash[:info] = "post approved"
          post.approved = true
          post.visible = true
          post.deny_message = ""
          post.save
          redirect_to "/posts/manage"
        elsif(params[:paction] == "deny")
          flash[:info] = "post denied"
          post.approved = false
          post.visible = false
          post.deny_message = params[:message]
          post.save
          redirect_to "/posts/manage"
        else
          redirect_to "/posts/manage"
        end
      else
        redirect_to user_path(current_user) unless()
      end
    else
      redirect_to root_path
    end
  end
  
  # def new
  #   @post = Post.new
  #   @subtexts = Subtext.all.collect {|s| [s.subtext, s._id]}
  # end
  
  def create
    data = params[:post]
    begin
      data[:subtext] = Subtext.criteria.id(params[:post][:subtext]).first.subtext
    rescue NoMethodError => e
      Rails.logger.error(e)
      # most likely, the subtext doesn't exist
      flash[:info] = "Please try again"
      redirect_to new_post_path and return
    end
    
    @post = Post.new(data)
    if(@post.save)
      flash[:info] = "Your post has been created! Please allow some time for it to be approved."
      redirect_to posts_path
    else
      @subtexts = Subtext.all.collect {|s| [s.subtext, s._id]}
      render :action => "new"
    end
  end
end
