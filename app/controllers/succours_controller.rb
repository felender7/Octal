class SuccoursController < ApplicationController
  before_action :authenticate_user!
  before_action :set_succour, only: [:show, :edit, :update, :destroy]
  before_action :correct_user_for_succours, only: [:edit, :update, :destroy]
  before_action :current_user_succours, only:[:show]
  # GET /succours
  # GET /succours.json
  def index
    @succours = Succour.all
  end

  # GET /succours/1
  # GET /succours/1.json
  def show
  end

  # GET /succours/new
  def new
    @succour = current_user.succours.build
  end

  # GET /succours/1/edit
  def edit
  end

  # POST /succours
  # POST /succours.json
  def create
    @succour = current_user.succours.build(succour_params)
    respond_to do |format|
      if @succour.save
        format.html { redirect_to @succour, notice: 'Succour was successfully created.' }
        format.json { render :show, status: :created, location: @succour }
      else
        format.html { render :new }
        format.json { render json: @succour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /succours/1
  # PATCH/PUT /succours/1.json
  def update
    respond_to do |format|
      if @succour.update(succour_params)
        format.html { redirect_to @succour, notice: 'Succour was successfully updated.' }
        format.json { render :show, status: :ok, location: @succour }
      else
        format.html { render :edit }
        format.json { render json: @succour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /succours/1
  # DELETE /succours/1.json
  def destroy
    @succour.destroy
    respond_to do |format|
      format.html { redirect_to succours_url, notice: 'Succour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_succour
      @succour = Succour.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def succour_params
      params.require(:succour).permit(:task,:name, :level, :course, :question, :code, :slug)
    end

    # check if the user is authorised to edit,update or destroy the cv
    def correct_user_for_succours
      @succour = current_user.succours.find_by(params[:friendly])
          redirect_to succours_path, notice: "Not authorised to edit this succours" if @succour.nil?
    end
    # check if  cv belongs to the correct user - current user
      def current_user_succours
        if user_signed_in?
          @succours = current_user.succours.order("created_at DESC")
       end
     end
end
