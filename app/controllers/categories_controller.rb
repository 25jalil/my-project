class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.hash_tree
  end

  def new
    @category = Category.new
  end

  def create
    if params[:category][:parent_id].to_i > 0
      parent = Category.find_by_id(params[:category].delete(:parent_id))
      @category = parent.children.build(category_params)
    else
      @category = Category.new(category_params)
    end

    if @category.save
      flash[:success]= "Вы успешно создали категорию!"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
       redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end

  def find_category
    @category = Category.find(params[:id])
  end

end
