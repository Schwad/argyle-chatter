require "rails_helper"

describe Post do
  before :each do
      User.destroy_all
      Post.destroy_all
      Comment.destroy_all
      @user = User.create(
        id: 1,
        email: "schwad@gmail.com",
        password: "argyle chat"
        )
      @post1 = Post.create(
        id: 1,
        title: "well hello there",
        body: "this is awkward",
        user_id: 1
        )
      @post2 = Post.create(
        id: 2,
        title: "well hello there",
        body: "this is awkward",
        user_id: 1
        )
      @comment1 = Comment.create(
        id: 1,
        body: "That is a wild post",
        user_id: 1,
        post_id: 2
        )
      @comment2 = Comment.create(
        id: 2,
        body: "That is a wild comment",
        user_id: 1,
        post_id: 1
        )
      @comment3 = Comment.create(
        id: 3,
        body: "No it's not",
        user_id: 1,
        post_id: 2
        )
    end
  it "is valid with a user" do
      expect(@post2).to be_valid
  end
  it "is invalid without a user" do
      post = Post.new(
        title: "this is my title",
        body: "this is my body"
        )
      expect(post).to_not be_valid
  end

  it "only has one user" do
    expect(@post2.user_id).to eq(1)
  end
  it "can have many comments" do
    expect(@post2.comments.count).to eq(2)
  end

end