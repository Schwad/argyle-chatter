 require 'rails_helper'

 describe User do

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

    it "is valid with email and password" do
      user = User.new(
        email: "hello@gmail.com",
        password: "argyle chat",
      )
      expect(user).to be_valid
    end

    it "is invalid without email" do
      user = User.new(
        password: "argyle chat"
      )
      expect(user).to_not be_valid
    end

    it "has many posts" do
      expect(@user.posts.count).to eq(2)
    end

    it "has many comments" do
      expect(@user.comments.count).to eq(3)
    end

  end