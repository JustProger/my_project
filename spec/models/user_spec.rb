# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should be valid data' do
    expect(User.create(name: 'name', email: 'email@test.ru', password_digest: 'pass').valid?)
  end

  it 'should be invalid email format' do
    expect(User.create(name: 'name', email: 'email', password_digest: 'pass').invalid?)
  end

  it 'should be invalid data' do
    expect(User.create(name: 'name', email: 'email@test.ru', password_digest: nil).invalid?)
    expect(User.create(name: nil, email: 'email@test.ru', password_digest: 'pass').invalid?)
  end

  it 'should be name uniqness' do
    expect(User.create(name: 'name', email: 'email@test.ru', password_digest: 'pass').valid?)
    expect(User.create(name: 'name', email: 'email2@test.ru', password_digest: 'pass').invalid?)
  end
end

# require 'test_helper'

# class UserTest < ActiveSupport::TestCase
#   test "valid data" do
#     assert User.create(name: 'name', email: 'email@test.ru', password_digest: 'pass').valid?
#   end

#   test "invalid email format" do
#     assert User.create(name: 'name', email: 'email', password_digest: 'pass').invalid?
#   end

#   test "invalid data" do
#     assert User.create(name: 'name', email: 'email@test.ru', password_digest: nil).invalid?
#     assert User.create(name: nil, email: 'email@test.ru', password_digest: 'pass').invalid?
#   end

#   test "name uniqness" do
#     assert User.create(name: 'name', email: 'email@test.ru', password_digest: 'pass').valid?
#     assert User.create(name: 'name', email: 'email2@test.ru', password_digest: 'pass').invalid?
#   end
# end
