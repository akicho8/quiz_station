# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  before do
    @alice = create(:user)
    sign_in @alice

    Article.destroy_all
    @article = article_create
  end

  describe "index" do
    it "デフォルトは回答回数低い順" do
      get :index
      assert_response :success
    end
    it "マークしたもののみ表示" do
      get :index, :only_checked => "true"
      assert_response :success
    end
  end

  it "answered_counter_inc" do
    patch :answered_counter_inc, :id => @article.id
    assert_response :success
  end

  describe "mark_exec" do
    it "on" do
      patch :mark_exec, :id => @article.id
      assert_response :success
      current_user.articlemarks.exists?(@article).should == true
    end

    it "off" do
      @alice.articlemarks.create!(:article => @article)
      patch :mark_exec, :id => @article.id
      assert_response :success
      current_user.articlemarks.exists?(@article).should == false
    end
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
