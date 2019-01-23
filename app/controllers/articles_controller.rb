# Our Main Articles Controller used to list and show articles.
class ArticlesController < ApplicationController
  # GET /articles/:id
  # This action is used to return a specific article
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles
  def index
    # Returning recent articles paginated
    @articles = Article.recent_articles(params[:page])
  end
end
