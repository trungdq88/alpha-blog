require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: 'sports')
    @admin = User.create(username: 'admin', email: 'admin@admin.com',
                         password: 'password', admin: true)
  end

  test "get index" do
    get categories_path
    assert_response :success
  end

  test "get new" do
    log_in_as @admin, 'password'
    get new_category_path
    assert_response :success
  end

  test "get show" do
    get category_path(@category)
    assert_response :success
  end

end
