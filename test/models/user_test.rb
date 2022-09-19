require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:valid)
  end

  test 'valid user' do
    assert @user.valid?, '@user should be valid with name and email'
  end

  test 'invalid without name' do
    @user.name = nil
    refute @user.valid?, 'Failure message.'
    assert_not_nil @user.errors[:name], 'no name validation errors found'
  end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?, 'Failure message.'
    assert_not_nil @user.errors[:email], 'no email validation errors found'
  end

  test '#posts' do
    assert_equal 2, @user.posts.size
  end

  test '#recent' do
    assert_includes User.recent, users(:valid)
    refute_includes User.recent, users(:old)
  end

  test '#profile_photo_url' do
    photo_url = 'https://s.gravatar.com/avatar/d4c74594d841139328695756648b6bd6'
    assert_equal photo_url, @user.profile_photo_url
  end
end
