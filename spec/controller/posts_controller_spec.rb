require File.expand_path(File.join("..", "spec_helper"), File.dirname(__FILE__))

describe PostsController do
  include Devise::TestHelpers
  include RSpec::Rails::ControllerExampleGroup
  
  # render_views
  before(:each) do
    DatabaseCleaner.clean
    # PostsController.stubs(:new).returns(@post_controller = mock(:post, :save => true))
  end
  
  def do_create
    # post :create, :menu_item => {:name => 'value'}
  end
  
  describe "GET index" do
    it "should route to index" do
      get :index
      posts = assigns[:posts]
      posts.should_not be_nil
    end
    
    it "should show only posts approved and visible" do
      get :index
      posts = assigns[:posts]
      posts.each do |p|
        p.visible.should == true
        p.approved.should == true
      end
    end
  end
  
  describe "GET new" do
    it "should give me a new post" do
      get :new
      assigns[:post]
      assigns[:subtexts]
    end
  end
  
  describe "POST create" do
    before(:all) do
      submock = mock
      submock.expects(:id).with(1234).returns([OpenStruct.new({:subtext => "I hate it when"})])
      Subtext.expects(:criteria).returns(submock)
    end
    
    it "should create a new post" do
      post :create, {:post => {:subtext => 1234, :text => "that happens"}}
      Post.count.should == 1
    end
  end
  
  # descrie
end
