class ImportantMarksController < ApplicationController
  before_action :set_important_mark, only: [:show, :edit, :update, :destroy]

  # GET /important_marks
  # GET /important_marks.json
  def index
    @important_marks = ImportantMark.all
  end

  # GET /important_marks/1
  # GET /important_marks/1.json
  def show
  end

  # GET /important_marks/new
  def new
    @important_mark = ImportantMark.new
  end

  # GET /important_marks/1/edit
  def edit
  end

  # POST /important_marks
  # POST /important_marks.json
  def create
    @important_mark = ImportantMark.new(important_mark_params)

    respond_to do |format|
      if @important_mark.save
        format.html { redirect_to @important_mark, notice: 'ImportantMark was successfully created.' }
        format.json { render :show, status: :created, location: @important_mark }
      else
        format.html { render :new }
        format.json { render json: @important_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /important_marks/1
  # PATCH/PUT /important_marks/1.json
  def update
    respond_to do |format|
      if @important_mark.update(important_mark_params)
        format.html { redirect_to @important_mark, notice: 'ImportantMark was successfully updated.' }
        format.json { render :show, status: :ok, location: @important_mark }
      else
        format.html { render :edit }
        format.json { render json: @important_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /important_marks/1
  # DELETE /important_marks/1.json
  def destroy
    @important_mark.destroy
    respond_to do |format|
      format.html { redirect_to important_marks_url, notice: 'ImportantMark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_important_mark
    @important_mark = ImportantMark.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def important_mark_params
    params.require(:important_mark).permit(:user_id, :article_id)
  end
end
