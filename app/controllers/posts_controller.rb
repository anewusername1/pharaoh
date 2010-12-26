class PostsController < ActionController
  def index
    @posts = Post.all
  end
  
  def show
    @posts = Post.find(:id => params[:id])
  end
  
  def new
    post = Post.new
  end
  
  def create
    Post.create(params[:post])
  end
end