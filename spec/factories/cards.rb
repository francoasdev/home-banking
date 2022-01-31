# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  balance    :integer
#  number     :string
#  pin        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_cards_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
FactoryBot.define do
  factory :card do
    number { "" }
    pin { 1 }
    balance { "" }
    user { nil }
  end
end
