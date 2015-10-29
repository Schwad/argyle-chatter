require 'rails_helper'

describe StaticPagesController do

 describe "GET #index" do

    let(:post){create_list(:post, 5)}
    let(:user){create(:user, posts: post)}

    it "populates posts on main landing page" do
      get :index
      expect(assigns(:posts)).to match_array(post)
    end
  end

end