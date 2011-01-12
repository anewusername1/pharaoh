require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  require 'users_controller'
  class UsersController; def rescue_action(e) raise e end; end

  def setup
    @controller = UsersController.new
  end
  
  test "show" do
  end
  
  test "new" do
  end
  
  test "showposts" do
  end
  
  test "create" do
  end
  
  test "edit" do
  end
  
  test "update" do
  end
  
  test "destroy" do
  end
end
