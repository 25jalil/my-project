class ResultsController < ApplicationController
  def index
    if (!params[:query].empty? && params[:tag]) && ((!params[:start_date].empty?) && (!params[:end_date].empty?))
      @posts = ThinkingSphinx.search(params[:query], with: {created_at: Time.parse(params[:start_date])..Time.parse(params[:end_date]), tag_ids: params[:tag]})
    elsif !params[:query].empty? && params[:tag]
      @posts = ThinkingSphinx.search(params[:query], with: {tag_ids: params[:tag]})
    elsif !params[:query].empty? && ((!params[:start_date].empty?) && (!params[:end_date].empty?))
      @posts = ThinkingSphinx.search(params[:query], with: {created_at: Time.parse(params[:start_date])..Time.parse(params[:end_date])})
    else
      @posts = ThinkingSphinx.search(params[:query])
    end
  end
end
