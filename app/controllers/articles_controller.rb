# -*- coding: utf-8 -*-

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :answered_counter_inc]

  def index
    limit = 100
    if params[:checked_condition]
      @articles = Article.where(:important_flag => true).order("rand()").take(limit)
    else
      @articles = Article.order(:answered_counter).order("rand()").take(limit)
    end
  end

  def answered_counter_inc
    @article.answered_counter += 1
    @article.save!
    render json: { status: :ok }
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.js   { head :ok }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit!
  end
end
