require 'rails_helper'

RSpec.describe "cards/edit", type: :view do
  before(:each) do
    @card = assign(:card, Card.create!(
      number: "",
      pin: 1,
      balance: "",
      user: nil
    ))
  end

  it "renders the edit card form" do
    render

    assert_select "form[action=?][method=?]", card_path(@card), "post" do

      assert_select "input[name=?]", "card[number]"

      assert_select "input[name=?]", "card[pin]"

      assert_select "input[name=?]", "card[balance]"

      assert_select "input[name=?]", "card[user_id]"
    end
  end
end
