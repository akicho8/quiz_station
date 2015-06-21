# -*- coding: utf-8 -*-

if Rails.env.development?
end

User.destroy_all
User.create!(:email => "pinpon.ikeda@gmail.com", :password => "password")

require "csv"

# def file_content(basename)
#   file = [Pathname("#{__dir__}/#{basename}"), Pathname("~/Dropbox/アプリ/quiz_station/#{basename}").expand_path].find(&:exist?)
#   if file
#     file.read
#   else
#     require "dropbox_sdk"
#     require "kconv"
#     client = DropboxClient.new(ENV["DROPBOX_ACCESS_TOKEN"])
#     client.get_file("/#{basename}").toutf8
#   end
# end

TAG_FUNCTION = false

Article.destroy_all

require "dropbox_sdk"
require "kconv"
client = DropboxClient.new(ENV["DROPBOX_ACCESS_TOKEN"])
resp = client.metadata("/resources")
resp["contents"].each do |content|
  basename = Pathname(content["path"]).basename(".*").to_s
  article_group = ArticleGroup.create!(:name => basename)
  p article_group
  # p content["path"]
  str = client.get_file(content["path"]).toutf8
  str = str.gsub(/#.*/, "")
  list = CSV.parse(str, :headers => :first_row, :header_converters => :symbol, :skip_blanks => true, :converters => :numeric).collect(&:to_hash)
  # list = list.take(3)
  list.each do |attrs|
    if attrs[:question_body].present?
      article = article_group.articles.build(:question_body => attrs[:question_body])

      if TAG_FUNCTION
        if category = attrs[:category].presence
          article.category_tag_list = category
        end
        sub_categories = attrs[:sub_category].to_s.split("/")
        article.tag_list = sub_categories
      end

      article.save!
      p "Create #{article.id}"
    end
  end

  if TAG_FUNCTION
    list.each do |attrs|
      if attrs[:category].present? && attrs[:question_body].blank?
        sub_categories = attrs[:sub_categories].split("/")
        articles = Article.tagged_with(tags, :any => true, :on => :tags)
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
