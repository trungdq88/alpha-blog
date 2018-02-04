require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: 'sports');
  end

  test "should be valid" do
    assert @category.valid?
  end

  test "should have name" do
    @category.name = '';
    assert_not @category.valid?
  end

  test "name should not too short" do
    @category.name = 'aa';
    assert_not @category.valid?
  end

  test "name should not too long" do
    @category.name = 'a' * 26;
    assert_not @category.valid?
  end

  test "name should not duplicate" do
    @category.save
    @category2 = Category.new(name: 'sports')
    assert_not @category2.valid?
  end

end
