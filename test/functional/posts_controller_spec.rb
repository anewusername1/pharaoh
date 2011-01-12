require File.expand_path(File.join("..", "spec_helper"), File.dirname(__FILE__))

describe PostsController do
  before(:each) do
    PostsController.stub(:new).returns(@post_controller = mock(Post, :save => true))
  end
  
  def do_create
    post :create, :menu_item => {:name => 'value'}
  end
  
  describe "#index" do
    it "should give me a bunch of posts" do
      PostsController.should_receive(:new).with(:name => 'value').returns(@post_controller)
    end
  end
end
