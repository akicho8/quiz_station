class AnswerLogsController < ApplicationController
  before_action :set_answer_log, only: [:show, :edit, :update, :destroy]

  # GET /answer_logs
  # GET /answer_logs.json
  def index
    @answer_logs = AnswerLog.all
  end

  # GET /answer_logs/1
  # GET /answer_logs/1.json
  def show
  end

  # GET /answer_logs/new
  def new
    @answer_log = AnswerLog.new
  end

  # GET /answer_logs/1/edit
  def edit
  end

  # POST /answer_logs
  # POST /answer_logs.json
  def create
    @answer_log = AnswerLog.new(answer_log_params)

    respond_to do |format|
      if @answer_log.save
        format.html { redirect_to @answer_log, notice: 'AnswerLog was successfully created.' }
        format.json { render :show, status: :created, location: @answer_log }
      else
        format.html { render :new }
        format.json { render json: @answer_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answer_logs/1
  # PATCH/PUT /answer_logs/1.json
  def update
    respond_to do |format|
      if @answer_log.update(answer_log_params)
        format.html { redirect_to @answer_log, notice: 'AnswerLog was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer_log }
      else
        format.html { render :edit }
        format.json { render json: @answer_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answer_logs/1
  # DELETE /answer_logs/1.json
  def destroy
    @answer_log.destroy
    respond_to do |format|
      format.html { redirect_to answer_logs_url, notice: 'AnswerLog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer_log
      @answer_log = AnswerLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_log_params
      params.require(:answer_log).permit(:user_id, :article_id, :column_dummy1)
    end
end
