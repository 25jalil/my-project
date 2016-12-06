class ResultsController < ApplicationController
  def index
    @posts = ThinkingSphinx.search(params[:query], with: {created_at: Time.new(params[:start_date])..Time.new(params[:end_date])})
  end
end
