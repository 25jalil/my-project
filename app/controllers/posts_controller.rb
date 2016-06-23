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
    if params[:tags][:name]
      @tags = params[:tags][:name].split(/[, \.?!]+/)
      @tags.each do |tag|
        tag_new = Tag.new(name: tag)
        if tag_new.save
          @post = tag_new.build_post(post_params)
          if @post.save
            flash[:notice] = 'Вы успешно создали новый пост'
            redirect_to @post
          else
            render 'new'
          end
        else
          tag_find = Tag.find(name: params[:tags][:name])
          @post = tag_find.build_post(post_params)
          if @post.save
            flash[:notice] = 'Вы успешно создали новый пост'
            redirect_to @post
          else
            render 'new'
          end
        end
      end
    else
      @post = Post.new(post_params)
      if @post.save
        redirect_to @post
      else
        render 'new'
      end
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

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :category_id, :tags)
    end
end
