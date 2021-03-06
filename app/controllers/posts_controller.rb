class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:category]
      category_parent = Category.find_by(name: params[:category])
      array_of_categories = category_parent.self_and_descendant_ids
      iterator = Proc.new {|n| n}
      @posts = Post.where(category_id: array_of_categories.each(&iterator)).order(cached_votes_score: :asc).reverse
    elsif params[:tag]
      @posts = Post.posts_for_tag(params[:tag])
    else
      @posts = Post.all.order(cached_votes_score: :asc).reverse
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
        @tag = Tag.new(name: tag.downcase)
         if @tag.save
           @post.tags << @tag
         else
          @tag_find_to_database = Tag.where(name: tag.downcase )
          @post.tags << @tag_find_to_database
        end
      end

      if @post.save
        redirect_to @post
      else
        render 'new'
      end
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

  def upvote
    @post.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @post.downvote_by current_user
    redirect_to :back
  end

  def calendar
  end

  private
    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :category_id, :tags)
    end
end
