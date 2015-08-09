class HideMarksController < ApplicationController
  before_action :set_hide_mark, only: [:show, :edit, :update, :destroy]

  # GET /hide_marks
  # GET /hide_marks.json
  def index
    @hide_marks = HideMark.all
  end

  # GET /hide_marks/1
  # GET /hide_marks/1.json
  def show
  end

  # GET /hide_marks/new
  def new
    @hide_mark = HideMark.new
  end

  # GET /hide_marks/1/edit
  def edit
  end

  # POST /hide_marks
  # POST /hide_marks.json
  def create
    @hide_mark = HideMark.new(hide_mark_params)

    respond_to do |format|
      if @hide_mark.save
        format.html { redirect_to @hide_mark, notice: 'HideMark was successfully created.' }
        format.json { render :show, status: :created, location: @hide_mark }
      else
        format.html { render :new }
        format.json { render json: @hide_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hide_marks/1
  # PATCH/PUT /hide_marks/1.json
  def update
    respond_to do |format|
      if @hide_mark.update(hide_mark_params)
        format.html { redirect_to @hide_mark, notice: 'HideMark was successfully updated.' }
        format.json { render :show, status: :ok, location: @hide_mark }
      else
        format.html { render :edit }
        format.json { render json: @hide_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hide_marks/1
  # DELETE /hide_marks/1.json
  def destroy
    @hide_mark.destroy
    respond_to do |format|
      format.html { redirect_to hide_marks_url, notice: 'HideMark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_hide_mark
    @hide_mark = HideMark.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def hide_mark_params
    params.require(:hide_mark).permit(:user_id, :article_id)
  end
end
