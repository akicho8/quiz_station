# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  before do
    @alice = create(:user)
    sign_in @alice

    @article = create(:article)
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

  it "answer_logs_create" do
    patch :answer_logs_create, :id => @article.id
    assert_response :success
  end

  describe "mark_update" do
    it "on" do
      patch :mark_update, :id => @article.id, :important_flag => "true"
      assert_response :success
      @alice.marked_articles.include?(@article).should == true
    end

    it "off" do
      @alice.marked_articles << @article
      patch :mark_update, :id => @article.id
      assert_response :success
      @alice.marked_articles.include?(@article).should == false
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
    post :create, :article => attributes_for(:article, :book_id => create(:book))
    assert_response :redirect
  end

  it "edit" do
    get :edit, :id => @article.id
    assert_response :success
  end

  it "update" do
    put :update, :id => @article.id, :article => attributes_for(:article)
    assert_response :redirect
  end

  it "destroy" do
    delete :destroy, :id => @article.id
    assert_response :redirect
  end
end
