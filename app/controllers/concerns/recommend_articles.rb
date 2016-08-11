module RecommendArticles
  def recommend_articles
    @articles_hash = Hash.new
    @articles.each { |article|
      @articles_hash[article.title] = article.link    
    }
    
    @rec_articles = @articles_hash.select{ |title, link|
      title.match(/.*#{@feature_word1}.*|.*#{@feature_word2}.*|.*#{@feature_word3}.*|.*#{@feature_word4}.*|.*#{@feature_word5}.*|.*#{@feature_word6}.*|.*#{@feature_word7}.*/)
    }
end

end
