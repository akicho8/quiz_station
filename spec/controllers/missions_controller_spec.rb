# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe MissionsController, type: :controller do
  before do
    Mission.destroy_all
    @mission = mission_create
  end

  context "index" do
    it "index" do
      get :index
      assert_response :success
    end

    it "検索" do
      get :index, :query => @mission.tag_list, :format => "txt"
      assert_response :success
      assert_match /#{@mission.id}.*#{@mission.question_body}.*#{@mission.tag_list}.*#{@mission.answer_body}/m, response.answer_body
    end
  end

  it "show" do
    get :show, :id => @mission.id
    assert_response :success
  end

  it "new" do
    get :new
    assert_response :success
  end

  it "create" do
    post :create, :mission => {:question_body => hex, :tag_list => hex, :answer_body => hex}
    assert_response :redirect
  end

  it "edit" do
    get :edit, :id => @mission.id
    assert_response :success
  end

  it "update" do
    put :update, :id => @mission.id, :mission => {:question_body => hex, :tag_list => hex, :answer_body => hex}
    assert_response :redirect
  end

  it "destroy" do
    delete :destroy, :id => @mission.id
    assert_response :redirect
  end
end
