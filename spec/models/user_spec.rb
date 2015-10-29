require 'rails_helper'

describe User do

  let(:user){build(:user)}
  let(:admin){build(:admin)}

  describe "attributes" do

    context "with one user" do
      it "is valid with standard attributes" do
        expect(user).to be_valid
      end
      it "is not an admin on default" do
        expect(user.is_admin).to eq(false)
      end
      it "is an admin with an appropriate attribute" do
        expect(admin.is_admin).to eq(true)
      end
      it "has an email" do
        expect(user.email).to eq("myuser@gmail.com")
      end
      it "is invalid without email" do
        new_user = build(:user, :email => nil)
        expect(new_user).to_not be_valid
      end
      it "blocks short passwords" do
        new_user = build(:user, :password => "hi")
        expect(new_user).not_to be_valid
      end
      it "blocks long passwords" do
        new_user = build(:user, :password => "jdlakfjdkls;afjdksl;afjklds;ajfklsd;ajfklds;a")
        expect(new_user).not_to be_valid
      end


      it "prohibits fake email addresses" do
        new_user = build(:user, :email => "hello")
        expect(new_user).not_to be_valid
      end

    end

    context "with multiple users" do
      before do
        user.save!
      end
      it "prohibits duplicate email addresses" do
        new_user = build(:user, :email => user.email)
        expect(new_user).not_to be_valid
      end

      it "allows unique email addresses but same passwords" do
        new_user = build(:user, :email => "hello@hotmail.com")
        expect(new_user).to be_valid
      end


    end
  end

  describe "posts and comments" do

    let(:num_posts){ 5 }
    let(:num_comments){ 5 }

    context "belonging to user" do

      before do
        user.posts = create_list(:post, num_posts)
        user.comments = create_list(:comment, num_comments)
        user.save!
      end

      it "has many posts" do
        expect(user.posts.count).to eq(num_posts)
      end

      it "has many comments" do
        expect(user.comments.count).to eq(num_comments)
      end

      it "does not belong to another user" do
        new_user = build(:user, :email => "helloworld@gmail.com")
        expect(new_user.posts.count).to eq(0)
      end
    end
  end
end