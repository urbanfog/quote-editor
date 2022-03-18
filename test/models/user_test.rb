require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user name is correct" do
    assert 'Accountant', users(:accountant).name
  end
end
