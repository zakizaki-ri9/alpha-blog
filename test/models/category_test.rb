require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup
    @category = Category.new(name: "test") 
  end
  
  # インスタンス生成が行えたかの確認
  test "category should be valid" do
    assert @category.valid?
  end
  
  # 空の入力を許さないための確認
  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end
  
  # nameの重複登録確認
  test "name should be unique" do
    @category.save
    c2 = Category.new(name: "test")
    assert_not c2.valid?
  end
  
  # nameのlength確認
  test "name should not be too long" do
    @category.name = "a" + 26
    assert_not @category.valid?
  end
  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end
  
end
