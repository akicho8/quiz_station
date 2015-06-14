# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  before do
    sign_in create(:user)

    Article.destroy_all
    @article = article_create
  end

  it "index" do
    get :index
    assert_response :success
  end

  it "show" do
    get :show, :id => @article.id
    assert_response :success
  end

  it "new" do
    get :new
    assert_response :success
  end

  it "create" do
    post :create, :article => {:question_body => hex, :tag_list => hex}
    assert_response :redirect
  end

  it "edit" do
    get :edit, :id => @article.id
    assert_response :success
  end

  it "update" do
    put :update, :id => @article.id, :article => {:question_body => hex, :tag_list => hex}
    assert_response :redirect
  end

  it "destroy" do
    delete :destroy, :id => @article.id
    assert_response :redirect
  end
end
