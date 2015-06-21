class ArticlemarksController < ApplicationController
  before_action :set_articlemark, only: [:show, :edit, :update, :destroy]

  # GET /articlemarks
  # GET /articlemarks.json
  def index
    @articlemarks = Articlemark.all
  end

  # GET /articlemarks/1
  # GET /articlemarks/1.json
  def show
  end

  # GET /articlemarks/new
  def new
    @articlemark = Articlemark.new
  end

  # GET /articlemarks/1/edit
  def edit
  end

  # POST /articlemarks
  # POST /articlemarks.json
  def create
    @articlemark = Articlemark.new(articlemark_params)

    respond_to do |format|
      if @articlemark.save
        format.html { redirect_to @articlemark, notice: 'Articlemark was successfully created.' }
        format.json { render :show, status: :created, location: @articlemark }
      else
        format.html { render :new }
        format.json { render json: @articlemark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articlemarks/1
  # PATCH/PUT /articlemarks/1.json
  def update
    respond_to do |format|
      if @articlemark.update(articlemark_params)
        format.html { redirect_to @articlemark, notice: 'Articlemark was successfully updated.' }
        format.json { render :show, status: :ok, location: @articlemark }
      else
        format.html { render :edit }
        format.json { render json: @articlemark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articlemarks/1
  # DELETE /articlemarks/1.json
  def destroy
    @articlemark.destroy
    respond_to do |format|
      format.html { redirect_to articlemarks_url, notice: 'Articlemark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articlemark
      @articlemark = Articlemark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articlemark_params
      params.require(:articlemark).permit(:user_id, :article_id, :answered_counter, :important_flag)
    end
end
