require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  describe User do
    it "is valid with an email"
    it "is invalid without an email"
    it "has many posts"
    it "has many comments"
    it "does not own another users post or comment"
  end
end
