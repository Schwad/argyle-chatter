require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  let(:post){create_list(:post, 5)}
  let(:user){create(:user, posts: post)}

  describe "GET #index" do
    context "with params" do

      it "populates an array of posts" do
        get :index, user_id: user.id
        expect(assigns(:posts)).to match_array(post)
      end

      it "renders the :index view template" do
        get :index, user_id: user.id
        expect(response).to render_template :index
      end
    end

    context "without params" do

      it "rejects if user is logged out" do
        expect{ get :index }.to raise_error
      end

    end
  end

  describe "GET #show" do

    context "with valid params" do

      it "assigns the requested post to @post" do
        get :show, id: post[0], user_id: user.id
        expect(assigns(:post)).to eq(post[0])
      end

      it "renders the show template" do
        get :show, id: post[0], user_id: user.id
        expect(response).to render_template :show
      end

    end

    context "without valid params" do

      it "does not render show template without params" do
        expect{get :show, id: nil, user_id: nil
        }.to raise_error
      end

      it "redirects" do
        get :show, id: 1234, user_id: user.id
        expect(response).to redirect_to root_path
      end

      it "does not render show template with invalid params" do
        expect{get :show, id: post[5], user_id: user.id}.to raise_error
      end
    end

  end

  describe "GET #new" do

    it "renders the new template" do
      get :new, user_id: user.id
      expect(response).to render_template :new
    end

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
