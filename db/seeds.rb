# -*- coding: utf-8 -*-
require "csv"

def file_content(basename)
  file = [Pathname("#{__dir__}/#{basename}"), Pathname("~/Dropbox/アプリ/quiz_station/#{basename}").expand_path].find(&:exist?)
  if file
    file.read
  else
    require "dropbox_sdk"
    require "kconv"
    client = DropboxClient.new(ENV["DROPBOX_ACCESS_TOKEN"])
    client.get_file("/kotoba_dictionary.csv").toutf8
  end
end

str = file_content("kotoba_dictionary.csv")

Mission.destroy_all

list = CSV.parse(str, :headers => :first_row, :header_converters => :symbol, :skip_blanks => true, :converters => :numeric).collect(&:to_hash)

list.each do |attrs|
  question_body = attrs[:question_body]

  category = attrs[:category]
  tags = attrs[:word].split("/")

  if question_body.present?
    # p [category, tags]
    mission = Mission.create!({
        :question_body     => question_body,
        :category_tag_list => category,
        :tag_list          => tags,
      })
    p "Create #{mission.id}"
  end
end

list.each do |attrs|
  question_body = attrs[:question_body]

  category = attrs[:category]
  tags = attrs[:word].split("/")

  if question_body.blank?
    missions = Mission.tagged_with(tags, :any => true, :on => :tags)
    if missions.blank?
      # raise attrs.inspect
    end
    missions.each do |mission|
      mission.category_tag_list.add(category)
      mission.save!
      p "#{tags} で探して #{attrs[:category]} to #{mission.id}"
    end
  end
end
