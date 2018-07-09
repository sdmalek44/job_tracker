class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :destroy, :edit, :update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if Category.exists?(title: @category.title)
      flash.notice = "Sorry, the #{@category.title} category already exists"
      redirect_to new_category_path
    else
      @category.save
      redirect_to category_path(@category)
    end
  end

  def show
    @jobs = @category.jobs
  end

  def edit
    @category = set_category
  end

  def update
    @category.update(category_params)
    flash.notice = "Category updated"

    redirect_to category_path(@category)
  end

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
