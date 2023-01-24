# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'valid data' do
    expect(Comment.create(post_id: 0, content: nil, user_id: 0).invalid?)
    expect(Comment.create(post_id: nil, content: 'text', user_id: 0).invalid?)
    expect(Comment.create(post_id: 0, content: 'text', user_id: nil).invalid?)
  end

  it 'invalid data' do
    expect(Comment.create(post_id: 0, content: 'text', user_id: 0).valid?)
  end
end
