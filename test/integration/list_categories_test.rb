class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category1 = Category.create(name: 'Sports')
    @category2 = Category.create(name: 'Programming')
  end

  test "should show 2 categories" do
    get categories_path
    assert_template 'categories/index'
    assert_match 'Sports', response.body
    assert_match 'Programming', response.body
  end

end
