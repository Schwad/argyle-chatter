require "rails_helper"

describe Post do
  let(:user){build(:user)}
  let(:post){build(:post)}



  describe "attributes" do
    context "with one post" do



      it "is valid with standard attributes" do
        expect(post).to be_valid
      end

      it "requires a title" do
        new_post = build(:post, :title => nil)
        expect(new_post).not_to be_valid
      end

      it "requires a body" do
        new_post = build(:post, :body => nil)
        expect(new_post).not_to be_valid
      end

      it "must have a title above 8 characters" do
        new_post = build(:post, :title => "hi")
        expect(new_post).not_to be_valid
      end

      it "must not have a title longer than 200 characters" do
        new_post = build(:post, :title => "jfklsajfkldsajfkldsjfkldsjfkljadsklfjkladsjflkdsajfkldsajfkljdsaklfjdskljfkldsjflkadsjflkdajklfjadsklfjlkdsajflkdsajflkdsajfkladsjfkldasjflkadsjfkldsajfklsdajkljdsaklfjdslkfjlskdjfkldasjfkldsadkjlfadsljflkdasjflkadsjfkldsajfkldsjklfa")
        expect(new_post).not_to be_valid
      end

      it "must belong to a user" do
        new_post = build(:post, :user_id => nil)
        expect(new_post).not_to be_valid
      end
    end
  end
end