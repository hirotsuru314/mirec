require 'open-uri'
require 'rss'

namespace :crawl do
  desc "get articles"
  task get: :environment do
    
    #techcrunch
    url_techcrunch = "http://jp.techcrunch.com/feed/"
    rss = open(url_techcrunch) do |file|
      RSS::Parser.parse(file.read)
    end
    rss.items.each do |item|
      next if Article.where(link: item.link).present?
      Article.create(title: item.title, link: item.link)
    end
    
    #Hatena
    url_hatena = "http://b.hatena.ne.jp/entrylist/it.rss"
    opt = {}
    opt['User-Agent'] = 'Opera/9.80 (Windows NT 5.1; U; ja) Presto/2.7.62 Version/11.01'
    rss = open(url_hatena, opt) do |file|
      RSS::Parser.parse(file.read)
    end
    rss.items.each do |item|
      next if Article.where(link: item.link).present?
      Article.create(title: item.title, link: item.link)
    end
    
  end
end
