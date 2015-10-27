require 'rails_helper'

RSpec.describe PostsController, :type => :controller do



  describe "GET #index" do
    context "with params" do
      # post = create_list(:post, 5)
      # user = create(:user, posts: post)

      it "populates an array of posts"

      it "renders the :index view template"
    end

    context "without params" do

    end
  end

  describe "GET #show" do

    let(:post){create_list(:post, 5)}
    let(:user){create(:user, posts: post)}

    it "assigns the requested post to @post" do
      # post = create_list(:post, 5)
      # user = create(:user, posts: post)
      get :show, id: post[0], user_id: user.id
      expect(assigns(:post)).to eq(post[0])
    end

    it "renders the show template" do
      # post = create_list(:post, 5)
      # user = create(:user, posts: post)
      get :show, id: post[0], user_id: user.id
      expect(response).to render_template :show
    end

    it "does not render show template without params" do
      expect{get :show, id: nil, user_id: nil
      }.to raise_error
    end

    # it "raises no errors with correct inputs" do
  end

  describe "GET #new" do

  end

  describe "GET #edit" do

  end

  describe "POST #create" do

  end

  describe "PATCH #update" do

  end

  describe "DELETE #destroy" do

  end

end
