# frozen_string_literal: true

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
class Transaction < ApplicationRecord
  belongs_to :sender_card, foreign_key: :sender_card_id, class_name: 'Card'
  belongs_to :recipient_card, foreign_key: :recipient_card_id, class_name: 'Card'

  validates_uniqueness_of :sender_card_id, scope: :recipient_card_id
  validates :ammount, presence: true
end
