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
  
  test "invalid categoy submission results in failure" do
    get new_category_path
    assert_template 'categories/new'
    
    # 空欄は登録できないことを確認するためのロジック
    assert_no_difference 'Category.count' do
      post categories_path,
        category: {name: " "}
    end
    
    # render 'new' + _errorページが読み込まれていることの確認
    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
end 
