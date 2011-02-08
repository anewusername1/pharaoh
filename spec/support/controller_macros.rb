module ControllerMacros
  def login_admin
    before(:each) do
      User.delete_all
      sign_out :user
      sign_in Factory(:admin_user)
    end
  end
  
  def login_user
    before(:each) do
      User.delete_all
      sign_out :admin
      sign_in Factory(:user)
    end
  end
  
  def load_post
    before(:each) do
      Post.delete_all
      @post = Factory.create(:post)
    end
  end
  
  def load_subtexts
    before(:each) do
      Subtext.delete_all
      2.times do
        Factory.create(:subtext)
      end
    end
  end
end