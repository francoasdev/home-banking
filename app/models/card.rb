# frozen_string_literal: true

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
class Card < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :balance, presence: true
  validates :pin, presence: true, length: { is: 4 }
  validates_each :number do |record, attr, value|
    if value.include?('-')
      unless value.length == 19
        record.errors.add(attr, 'Invalid card number. You should put it in that way: xxxx-xxxx-xxxx-xxxx')
      end
    else
      unless value.length == 16
        record.errors.add(attr, 'Invalid card number. You should put it in that way: xxxx-xxxx-xxxx-xxxx')
      end
    end
  end
  validates_uniqueness_of :number
end
