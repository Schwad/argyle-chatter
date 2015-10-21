require 'rails_helper'

 describe User do

    let(:user){build(:user)}
    let(:admin){build(:admin)}

    describe "attributes" do
      context "with one user" do
        it "is valid with standard attributes (factory)" do
          expect(user).to be_valid
        end
        it "is not an admin on default" do
          expect(user.is_admin).to eq(false)
        end
        it "is an admin with an appropriate attribute" do
          expect(admin.is_admin).to eq(true)
        end
      end
      context "with multiple users" do


      end
    end

    it "is valid with email and password" do
      expect(user).to be_valid
    end

    it "is invalid without email" do
      expect(user).to_not be_valid
    end

    it "has many posts" do
      expect(@user.posts.count).to eq(2)
    end

    it "has many comments" do
      expect(@user.comments.count).to eq(3)
    end

  end