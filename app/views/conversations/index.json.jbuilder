# number of unread conversations
json.array!  @conversations_unread_uniq_id do |receipt|
  json.receipt receipt.id

end

