class ResultsController < ApplicationController
  def index
    if params[:start_date] && params[:end_date]
      @posts = ThinkingSphinx.search(params[:query])
    else
      @posts = ThinkingSphinx.search(params[:query], with: {created_at: Time.parse(params[:start_date])..Time.parse(params[:end_date])})
    end
  end
end
