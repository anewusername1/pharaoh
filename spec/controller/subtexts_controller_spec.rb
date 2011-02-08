require File.expand_path(File.join("..", "spec_helper"), File.dirname(__FILE__))

describe SubtextsController do
  describe "GET index" do
    describe "as admin" do
      login_admin
      it "should give me all available subtexts" do
        get :index
        assigns[:subtexts]
        response.should_not be_redirect
      end
    end
    
    describe "as user" do
      login_user
      it "should redirect me" do
        get :index
        response.should be_redirect
      end
    end
  end
  
  describe "GET new" do
    describe "as admin" do
      login_admin
      it "should give me an initialized post" do
        get :new
        assigns[:post]
      end
    end
    
    describe "as user" do
      login_user
      it "should redirect me" do
        get :new
        response.should be_redirect
      end
    end
  end
  
  describe "POST create" do
    describe "as admin" do
      login_admin
      it "should create a new subtext" do
        post :create, {:subtext => "I love it when"}
        response.location.should == "blah"
      end
    end
    
    describe "as user" do
      login_user
      it "should redirect me" do
        post :create, {:subtext => "yo mama was a snow blower"}
        response.location.should == "ah hah"
      end
    end
  end
  
  describe "DELETE destroy" do
    load_subtexts
    describe "as admin" do
      login_admin
      it "should delete the subtext" do
        delete :destroy, {:id => Subtext.first._id.to_s}
      end
    end
    
    describe "as user" do
      login_user
      it "should redirect me"
    end
  end
end
  