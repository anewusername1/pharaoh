class PostsController < ApplicationController
  def index
    @posts = Post.find(:all, :conditions => {:approved => true, :visible => true}).order_by(:created_at.desc)
  end
  
  def show
    @posts = Post.find(:id => params[:id])
  end
  
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
    @unapproved_posts = Post.find(:all, :conditions => {:approved => nil})
    @approved_posts = Post.find(:all, :conditions => {:approved => true})
    if(current_user)
      redirect_to user(current_user) unless(can?(:manage, @posts))
    else
      redirect_to root_path
    end
  end
  
  def manage
    post = Post.criteria.id(params[:id]).first
    if(params[:paction] == "approve")
      flash[:info] = "post approved"
      post.approved = true
      post.visible = true
    elsif(params[:paction] == "deny")
      flash[:info] = "post denied"
      post.approved = false
      post.visible = false
    else
      redirect_to "/posts/manage"
    end
    post.save
    redirect_to "/posts/manage"
  end
  
  def new
    @post = Post.new
    @subtexts = Subtext.all.collect {|s| [s.subtext, s._id]}
  end
  
  def create
    data = params[:post]
    data[:subtext] = Subtext.criteria.id(params[:post][:subtext]).first.subtext
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