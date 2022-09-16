require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(name: 'John', email: 'john@example.com')
    assert user.valid?, 'User should be valid with name and email'
  end

  test 'invalid without name' do
    user = User.new(email: 'john@example.com')
    refute user.valid?, 'Failure message.'
    assert_not_nil user.errors[:name], 'no name validation errors found'
  end

  test 'invalid without email' do
    user = User.new(name: 'John Doe')
    refute user.valid?, 'Failure message.'
    assert_not_nil user.errors[:email], 'no email validation errors found'
  end
end
