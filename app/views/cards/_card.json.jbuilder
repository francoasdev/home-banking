json.extract! card, :id, :number, :pin, :balance, :user_id, :created_at, :updated_at
json.url card_url(card, format: :json)
