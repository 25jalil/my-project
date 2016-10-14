class ResultsController < ApplicationController
  def index
    @posts = ThinkingSphinx.search(params[:query])
  end
end
