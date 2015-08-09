json.array!(@hide_marks) do |hide_mark|
  json.extract! hide_mark, :id, :user_id, :article_id, :answered_counter, :hide_flag
  json.url hide_mark_url(hide_mark, format: :json)
end
