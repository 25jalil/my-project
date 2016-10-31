class ResultsController < ApplicationController
  def index
    @posts = ThinkingSphinx.search(params[:query], :with => {:created_at => params[:start_date]..params[:end_date]})
  end
end
