require 'spec_helper'

RSpec.describe PostsController, type: :controller do

  describe "POST #create" do
    context "with valid attributes" do
      it "create new post" do
        post :create, post: attributes_for(:post)
        expect(Post.count) == 1
      end
    end
  end
end
