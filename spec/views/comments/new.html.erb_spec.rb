require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      post: 1,
      author: 1,
      content: "MyString"
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input[name=?]", "comment[post]"

      assert_select "input[name=?]", "comment[author]"

      assert_select "input[name=?]", "comment[content]"
    end
  end
end
