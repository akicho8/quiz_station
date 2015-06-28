json.array!(@important_marks) do |important_mark|
  json.extract! important_mark, :id, :user_id, :article_id, :answered_counter, :important_flag
  json.url important_mark_url(important_mark, format: :json)
end
