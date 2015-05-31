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
  if question_body.blank?
    next
  end
  answer_body = nil
  # md = question_body.match(/\((.*)\)/)
  # unless md
  #   raise attrs.inspect
  # end
  # answer_body = md.captures.first
  # question_body = question_body.sub(/\(.*\)/, "（？）")
  p Mission.create!({
      :question_body     => question_body,
      :answer_body       => answer_body,
      :category_tag_list => attrs[:category],
      :tag_list          => [attrs[:category],attrs[:word]].join(" "),
    })
end
