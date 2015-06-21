json.array!(@articlemarks) do |articlemark|
  json.extract! articlemark, :id, :user_id, :article_id, :answered_counter, :important_flag
  json.url articlemark_url(articlemark, format: :json)
end
