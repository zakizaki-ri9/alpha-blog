require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  def setup
    @c = Category.create(name: "test")
  end
  
  test "should get categories index" do
    get :index
    assert_response :success
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should get show" do
    get(:show, {'id' => @c.id})
    assert_response :success
  end
end
