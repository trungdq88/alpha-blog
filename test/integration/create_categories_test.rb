class CreateCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @admin = User.create(username: 'admin', email: 'admin@admin.com',
                         password: 'password', admin: true)
  end

  test "create new categories" do
    log_in_as @admin, 'password'
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: 'Sports' } }
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match 'Sports', response.body
  end

  test "create new categories failed" do
    log_in_as @admin, 'password'
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: 'a' } }
    end
    assert_template 'categories/new'
    assert_match 'Name is too short (minimum is 3 characters)', response.body
  end

  test "redirect if non-admin users create new categories" do
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: 'a' } }
    end
    assert_redirected_to categories_path
  end

end
