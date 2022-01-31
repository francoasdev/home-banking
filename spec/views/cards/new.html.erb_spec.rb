require 'rails_helper'

RSpec.describe "cards/new", type: :view do
  before(:each) do
    assign(:card, Card.new(
      number: "",
      pin: 1,
      balance: "",
      user: nil
    ))
  end

  it "renders new card form" do
    render

    assert_select "form[action=?][method=?]", cards_path, "post" do

      assert_select "input[name=?]", "card[number]"

      assert_select "input[name=?]", "card[pin]"

      assert_select "input[name=?]", "card[balance]"

      assert_select "input[name=?]", "card[user_id]"
    end
  end
end
