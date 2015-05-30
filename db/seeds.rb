# -*- coding: utf-8 -*-
require "csv"

if false
  str = Pathname("#{__dir__}/kotoba_dictionary.csv").read
end

if true
  require "dropbox_sdk"
  require "kconv"
  client = DropboxClient.new(ENV["DROPBOX_ACCESS_TOKEN"])
  str = client.get_file("/kotoba_dictionary.csv").toutf8
end

CSV.parse(str, :headers => :first_row, :header_converters => :symbol, :skip_blanks => true, :converters => :numeric) do |line|
  attrs = line.to_hash
  question_body = attrs[:question_body]
  md = question_body.match(/\((.*)\)/)
  answer_body = md.captures.first
  question_body = question_body.sub(/\(.*\)/, "（？）")
  p Mission.create(:question_body => question_body, :answer_body => answer_body, :tag_list => [attrs[:category], attrs[:word]].join(" "))
end
