require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  let(:comment) {
    Comment.create!(
      post: 1,
      author: 1,
      content: "MyString"
    )
  }

  before(:each) do
    assign(:comment, comment)
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(comment), "post" do

      assert_select "input[name=?]", "comment[post]"

      assert_select "input[name=?]", "comment[author]"

      assert_select "input[name=?]", "comment[content]"
    end
  end
end
