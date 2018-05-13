require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  def setup
    @c = Category.create(name: "test")
    @user = User.create(username: "ccc", email: "ccc@a.com", password: "ccc", admin: true)
  end
  
  test "should get categories index" do
    get :index
    assert_response :success
  end
  
  test "should get new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end
  
  test "should get show" do
    get(:show, {'id' => @c.id})
    assert_response :success
  end
  
  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post :create, category: {name: "test"}
    end
    assert_redirected_to categories_path
  end
  
end
