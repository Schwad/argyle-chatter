require "rails_helper"


describe Comment do

  let(:comment){build(:comment)}
  let(:user){build(:user)}
  let(:post){build(:post)}

  describe "attributes" do
    context "with one comment" do

        before do
          user.comments = create_list(:comment, 2)
          user.save!
        end

        it "is valid with a user" do
          expect(user.comments.count).to eq(2)
        end

        it "is invalid without a post" do
          new_comment = build(:comment, :post_id => nil)
          expect(new_comment).to_not be_valid
        end

        it "is invalid without a user" do
          new_comment = build(:comment, :user_id => nil)
          expect(new_comment).to_not be_valid
        end
    end
  end
end