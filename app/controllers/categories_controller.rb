class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:message] = 'Category created!'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show

  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
