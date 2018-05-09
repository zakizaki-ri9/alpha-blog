require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test "get new category form and create category" do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      #POSTのリクエストテスト
      post_via_redirect categories_path,
        category: {name: "test"}
    end
    assert_template 'categories/index'
    assert_match "test", response.body
  end
end 
