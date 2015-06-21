json.array!(@answer_logs) do |answer_log|
  json.extract! answer_log, :id, :user_id, :article_id, :column_dummy1
  json.url answer_log_url(answer_log, format: :json)
end
