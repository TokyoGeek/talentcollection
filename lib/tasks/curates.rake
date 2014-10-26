namespace :curates do
  require 'open-uri'
  require 'nokogiri'

  desc "curate horipuro office"

  # :environment は モデルにアクセスするのに必須
  task :horipro_cat => :environment do
    # 処理を記述
    # スクレイピング先のURL
    # ホリプロのタレント検索結果(全員)
    array=[]
    url = 'http://www.horipro.co.jp/talent-search/?search_flag=attribute&sex%5B%5D=%E7%94%B7%E6%80%A7&sex%5B%5D=%E5%A5%B3%E6%80%A7'

    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end

    # htmlをパース(解析)してオブジェクトを作成
    doc = Nokogiri::HTML.parse(html, nil, charset)

    doc.xpath('//li[@class="talent-item"]').each do |node|
      #詳細画面urlの取得
      if profile_page_url = node.css('.name a').attr('href').to_s
        profile_page_charset = nil

        profile_page_html = open(profile_page_url) do |f2|
          profile_page_charset = f2.charset # 文字種別を取得
          f2.read # htmlを読み込んで変数htmlに渡す
        end

        profile_page_doc = Nokogiri::HTML.parse(profile_page_html, nil, profile_page_charset)

        tr_len = profile_page_doc.css('.prof-tbl > tr').length
        for num in 1..tr_len
          cat_tag = profile_page_doc.css(".profile-area.fl.ml6.rmgn > div > table > tr:nth-child(#{num}) > th > p").text.scan(/[\S]+/)
          unless array.include? cat_tag
            array << cat_tag
          end
        end
      end
    end
    p array
  end

end
