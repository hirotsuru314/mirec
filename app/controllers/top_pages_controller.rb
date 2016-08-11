class TopPagesController < ApplicationController
  include HatenaBookmark
  include FeatureWords
  include RecommendArticles
  #before_action :logged_in_user
  
  def index
    @articles = Article.all
    bookmark_titles
    feature_words_extraction
    recommend_articles
  end

end