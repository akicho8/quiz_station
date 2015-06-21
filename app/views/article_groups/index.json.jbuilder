json.array!(@article_groups) do |article_group|
  json.extract! article_group, :id, :user_id, :name
  json.url article_group_url(article_group, format: :json)
end
