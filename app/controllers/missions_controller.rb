# -*- coding: utf-8 -*-

class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update, :destroy, :marubatu, :answered_counter_inc]

  def index
    limit = 30
    if params[:not_answered_order]
      @missions = Mission.order(:answered_counter).order("rand()").take(limit)
    elsif params[:checked_condition]
      @missions = Mission.where(:important_flag => true).order("rand()").take(limit)
    else
      @missions = Mission.order("rand()").take(limit)
    end
  end

  def answered_counter_inc
    @mission.answered_counter += 1
    @mission.save!
    render json: { status: :ok }
  end

  def show
  end

  def new
    @mission = Mission.new
  end

  def edit
  end

  def create
    @mission = Mission.new(mission_params)

    respond_to do |format|
      if @mission.save
        format.html { redirect_to @mission, notice: 'Mission was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mission }
      else
        format.html { render action: 'new' }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mission.update(mission_params)
        format.html { redirect_to @mission, notice: 'Mission was successfully updated.' }
        format.js   { head :ok }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mission.destroy
    respond_to do |format|
      format.html { redirect_to missions_url }
      format.json { head :no_content }
    end
  end

  private

  def set_mission
    @mission = Mission.find(params[:id])
  end

  def mission_params
    params.require(:mission).permit!
  end
end
