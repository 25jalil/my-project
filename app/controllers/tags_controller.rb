class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @tag.destroy
    flash[:success] = "Тег успешно удален!"
    redirect_to tags_path
  end

  private

    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:name)
    end
end
