# json.array!  @conversations_mailbox do |conversation|
#   json.subject conversation.subject
#   json.participants conversation.participants
#   json.updated_at conversation.updated_at
# end

# number of unread conversations
json.array!  @conversations_unread_uniq_id do |receipt|
  json.receipt receipt.id

end
