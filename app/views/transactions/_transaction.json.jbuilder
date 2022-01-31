json.extract! transaction, :id, :ammount, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
