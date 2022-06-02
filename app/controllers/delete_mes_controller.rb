class DeleteMesController < ApplicationController
  before_action :set_delete_me, only: %i[ show edit update destroy ]

  # GET /delete_mes or /delete_mes.json
  def index
    @delete_mes = DeleteMe.all
  end

  # GET /delete_mes/1 or /delete_mes/1.json
  def show
  end

  # GET /delete_mes/new
  def new
    @delete_me = DeleteMe.new
  end

  # GET /delete_mes/1/edit
  def edit
  end

  # POST /delete_mes or /delete_mes.json
  def create
    @delete_me = DeleteMe.new(delete_me_params)

    respond_to do |format|
      if @delete_me.save
        format.html { redirect_to delete_me_url(@delete_me), notice: "Delete me was successfully created." }
        format.json { render :show, status: :created, location: @delete_me }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @delete_me.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delete_mes/1 or /delete_mes/1.json
  def update
    respond_to do |format|
      if @delete_me.update(delete_me_params)
        format.html { redirect_to delete_me_url(@delete_me), notice: "Delete me was successfully updated." }
        format.json { render :show, status: :ok, location: @delete_me }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @delete_me.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delete_mes/1 or /delete_mes/1.json
  def destroy
    @delete_me.destroy

    respond_to do |format|
      format.html { redirect_to delete_mes_url, notice: "Delete me was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delete_me
      @delete_me = DeleteMe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def delete_me_params
      params.require(:delete_me).permit(:somestring)
    end
end
