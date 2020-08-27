class SupportsController < ApplicationController
  before_action :set_support, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user_for_support, only: [:edit, :update, :destroy]
  before_action :current_user_support, only:[:show]
  # GET /supports
  # GET /supports.json
  def index
    @supports = Support.paginate(:page => params[:page], :per_page => 3).order("created_at DESC")
  end

  # GET /supports/1
  # GET /supports/1.json
  def show
  end

  # GET /supports/new
  def new
    @support = current_user.supports.build
  end

  # GET /supports/1/edit
  def edit
  end

  # POST /supports
  # POST /supports.json
  def create
    @support = current_user.supports.build(support_params)

    respond_to do |format|
      if @support.save
        format.html { redirect_to @support, notice: 'Support was successfully created.' }
        format.json { render :show, status: :created, location: @support }
      else
        format.html { render :new }
        format.json { render json: @support.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supports/1
  # PATCH/PUT /supports/1.json
  def update
    respond_to do |format|
      if @support.update(support_params)
        format.html { redirect_to @support, notice: 'Support was successfully updated.' }
        format.json { render :show, status: :ok, location: @support }
      else
        format.html { render :edit }
        format.json { render json: @support.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supports/1
  # DELETE /supports/1.json
  def destroy
    @support.destroy
    respond_to do |format|
      format.html { redirect_to supports_url, notice: 'Support was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support
      @support = Support.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def support_params
      params.require(:support).permit(:subject, :message, :user_id, :slug)
    end

    # check if the user is authorised to edit,update or destroy the cv
    def correct_user_for_support
      @support = current_user.supports.find_by(params[:friendly])
          redirect_to supports_path, notice: "Not authorised to edit this support" if @support.nil?
    end
    # check if  cv belongs to the correct user - current user
      def current_user_support
        if user_signed_in?
         @supports = current_user.supports.order("created_at DESC")
       end
     end
end
