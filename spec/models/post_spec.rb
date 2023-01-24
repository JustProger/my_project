# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'invalid data' do
    expect(Post.create(title: nil, content: '_', user_id: 0).invalid?)
    expect(Post.create(title: '_', content: nil, user_id: 0).invalid?)
    expect(Post.create(title: '_', content: '_', user_id: nil).invalid?)
  end

  it 'valid data' do
    expect(Post.create(title: 'title', content: 'some content', user_id: 0).valid?)
  end
end
