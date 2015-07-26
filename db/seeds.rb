# -*- coding: utf-8 -*-
require "dropbox_sdk"
require "kconv"
require "csv"

User.destroy_all                # これですべて消える

User.create!(:email => "pinpon.ikeda@gmail.com", :password => "password")
current_user = User.first

@use_tag = false

client = DropboxClient.new(ENV["DROPBOX_ACCESS_TOKEN"])
resp = client.metadata("/resources")
resp["contents"].each do |content|
  p content["path"]
  if content["path"] == "/resources/.git"
    next
  end
  if content["path"].match(/エンコードの競合/)
    next
  end
  name = Pathname(content["path"]).basename(".*").to_s
  book = current_user.books.create!(name: name)
  p book
  str = client.get_file(content["path"]).toutf8
  str = str.gsub(/#.*/, "")
  records = CSV.parse(str, headers: :first_row, header_converters: :symbol, skip_blanks: true, converters: :numeric).collect(&:to_hash)
  if Rails.env.development?
    records = records.take(3)
  end
  records.each do |attrs|
    if attrs[:question_body].present?
      article = book.articles.build(question_body: attrs[:question_body])

      if @use_tag
        if category = attrs[:category].presence
          article.category_tag_list = category
        end
        sub_categories = attrs[:sub_category].to_s.split("/")
        article.tag_list = sub_categories
      end

      article.save!
      p "Create ##{article.id}"
    end
  end

  if @use_tag
    records.each do |attrs|
      if attrs[:category].present? && attrs[:question_body].blank?
        sub_categories = attrs[:sub_categories].split("/")
        articles = Article.tagged_with(tags, any: true, on: :tags)
        if articles.blank?
          # raise attrs.inspect
        end
        articles.each do |article|
          article.category_tag_list.add(attrs[:category])
          article.save!
          p "#{tags} で探して #{attrs[:category]} to #{article.id}"
        end
      end
    end
  end
end
