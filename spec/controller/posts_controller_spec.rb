require File.expand_path(File.join("..", "spec_helper"), File.dirname(__FILE__))

describe PostsController do
  include Devise::TestHelpers
  include RSpec::Rails::ControllerExampleGroup
  
  # render_views
  before(:each) do
    DatabaseCleaner.clean
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
    
    describe "valid posts" do
      it "should create a new post" do
        post :create, {:post => {:subtext => 1234, :text => "that happens"}}
        Post.count.should == 1
      end
    end    
    
    describe "invalid posts" do
      before(:each) do
        post :create, {:post => {:subtext => 1235, :text => "haha"}}
      end
      
      it "should not create an invalid post" do
        Post.count.should == 0
      end
      
      it "should redirect back" do
        response.should be_redirect
      end
    end
    
  end
  
  describe "GET unapproved" do
    it "should show me unapproved posts if I am admin"
    it "should redirect me if I'm not admin"
  end
  
  describe "DELETE destroy" do
    describe "as admin" do
      it "should delete a post"
    end
    
    describe "not admin" do
      it "should redirect"
      it "should not delete the post if"
    end
  end
  
  describe "GET manage" do
    describe "as admin" do
      it "should allow me to view the manage page if I'm admin"
    end
    
    describe "not admin" do
      it "should redirect me"
    end
  end
end
