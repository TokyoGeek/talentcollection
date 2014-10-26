namespace :curates do
  require 'open-uri'
  require 'nokogiri'

  desc "Generate report"

  # :environment は モデルにアクセスするのに必須
  task :generate => :environment do
    # 処理を記述
    # スクレイピング先のURL
    # ホリプロのタレント検索結果(全員)
    url = 'http://www.horipro.co.jp/talent-search/?search_flag=attribute&sex%5B%5D=%E7%94%B7%E6%80%A7&sex%5B%5D=%E5%A5%B3%E6%80%A7'

    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end

    # htmlをパース(解析)してオブジェクトを作成
    doc = Nokogiri::HTML.parse(html, nil, charset)

    doc.xpath('//li[@class="talent-item"]').each do |node|
      # tilte
      p node.css('.name a').text
      p node.css('.name a').attr('href').to_s

      # # 記事のサムネイル画像
      # p node.css('img').attribute('src').value
      #
      # # 記事のサムネイル画像
      # p node.css('a').attribute('href').value
    end
  end


end
