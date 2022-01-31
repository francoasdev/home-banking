# == Schema Information
#
# Table name: transactions
#
#  id                :integer          not null, primary key
#  ammount           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  recipient_card_id :integer          not null
#  sender_card_id    :integer          not null
#
# Foreign Keys
#
#  recipient_card_id  (recipient_card_id => cards.id)
#  sender_card_id     (sender_card_id => cards.id)
#
FactoryBot.define do
  factory :transaction do
    ammount { "" }
  end
end
