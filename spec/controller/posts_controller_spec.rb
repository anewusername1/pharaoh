require File.expand_path(File.join("..", "spec_helper"), File.dirname(__FILE__))

describe PostsController do
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
    describe "as admin" do
      login_admin
    
      it "should show me unapproved posts if I am admin" do
        get :unapproved
        response.should_not be_redirect
        assigns[:unapproved_posts]
      end
    end
    
    describe "not admin" do
      login_user
      
      it "should redirect me if I'm not admin" do
        get :unapproved
        response.should be_redirect
        response.location.should =~ /http:\/\/test\.host\/user/
      end
    end
  end
  
  describe "DELETE destroy" do
    load_post
    
    describe "as admin" do
      login_admin
      
      it "should delete a post" do
        delete :destroy, {:id => @post._id.to_s}
        Post.count.should == 0
      end
    end
    
    describe "not admin" do
      it "should redirect" do
        delete :destroy, {:id => @post._id.to_s}
        response.should be_redirect
      end
      
      it "should not delete the post if" do
        delete :destroy, {:id => @post._id.to_s}
        Post.count.should > 0
      end
    end
  end
  
  describe "PUT manage" do
    describe "as admin" do
      login_admin
      load_post
      it "should allow me to approve a post" do
        put :manage, {:id => @post._id.to_s, :paction => "approve"}
        @post.reload
        @post.approved.should == true
        @post.visible.should == true
      end
      
      it "should allow me to deny a post" do
        put :manage, {:id => @post._id.to_s, :paction => "deny"}
        @post.reload
        @post.approved.should == false
        @post.visible.should == false
      end
      
      it "should allow me to deny a post with a message" do
        put :manage, {:id => @post._id.to_s, :paction => "deny", :message => "This post is offensive. It offends."}
        @post.reload
        @post.approved.should == false
        @post.visible.should == false
        @post.deny_message.should == "This post is offensive. It offends."
      end
    end
    
    describe "not admin" do
      load_post
      it "should redirect me" do
        put :manage, {:id => @post._id.to_s, :paction => "approve"}
        response.should be_redirect
      end
      
      it "should not change anything" do
        put :manage, {:id => @post._id.to_s, :paction => "approve"}
        @post.reload
        @post.approved.should == false
        @post.visible.should == false
      end
    end
  end
end
