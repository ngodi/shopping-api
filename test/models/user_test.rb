require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'user with a valid email should be valid' do
    user = User.new(email: 'user@email.com', password_digest: 'testuser')
    assert user.valid?
  end

  test 'user with invalid email should be invalid' do
    user = User.new(email: 'user', password_digest: 'testuser')
    assert_not user.valid?
  end

  test 'user with taken email should be invalid' do
    other_user = users(:one)
    user = User.new(email: other_user.email, password_digest:
    'test')
    assert_not user.valid?
  end
end
