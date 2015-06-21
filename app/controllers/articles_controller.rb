# -*- coding: utf-8 -*-

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :answered_counter_inc, :mark_exec]

  def index
    if params[:article_group_id]
      articles = ArticleGroup.find(params[:article_group_id]).articles
    else
      articles = Article.all
    end

    limit = 100
    if params[:only_checked]
      @articles = current_user.marked_articles.order("rand()").take(limit)
    else
      @articles = articles.joins("LEFT JOIN answer_logs ON answer_logs.article_id = articles.id AND answer_logs.user_id = #{current_user.id}").order("COUNT(answer_logs.id), rand()").group("articles.id").limit(limit)
    end
  end

  def answered_counter_inc
    current_user.answer_logs.create!(:article => @article)
    render json: { status: :ok }
  end

  def mark_exec
    if params[:important_flag2]
      unless current_user.marked_articles.include?(@article)
        current_user.marked_articles << @article
      end
    else
      current_user.marked_articles.destroy(@article)
    end
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
