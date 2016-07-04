class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:category]
      category_parent = Category.find_by(name: params[:category])
      array_of_categories = category_parent.self_and_descendant_ids
      iterator = Proc.new {|n| n}
      @posts = Post.where(category_id: array_of_categories.each(&iterator)).order("created_at DESC")
    else
      @posts = Post.all.order("created_at DESC")
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @tags = params[:post][:tags]["name"].split(/[, \.?!]+/)
      @tags.each do |tag|
        @tag = Tag.new(name: tag)
        @post.tags << @tag
        @post.save
      end
    redirect_to @post
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :category_id, :tags)
    end
end
