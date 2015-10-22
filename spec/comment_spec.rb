require "rails_helper"


describe Comment do

  let(:comment){build(:comment)}
  let(:user){build(:user)}
  let(:post){build(:post)}

  describe "attributes" do
    context "with one comment" do
        it "is valid with a user" do
          user.save!
          comment.save!
          expect(comment.user).to be_valid
        end
        it "is valid with a post"
        it "is invalid without a post"
        it "is invalid without a user"
        it "only belongs to one user and one post"

    end
  end

end