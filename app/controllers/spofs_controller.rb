class SpofsController < ApplicationController
  before_action :set_spof, only: %i[ show edit update destroy ]

  # GET /spofs or /spofs.json
  def index
    @spofs = Spof.all
  end

  # GET /spofs/1 or /spofs/1.json
  def show
  end

  # GET /spofs/new
  def new
    @spof = Spof.new
  end

  # GET /spofs/1/edit
  def edit
  end

  # POST /spofs or /spofs.json
  def create
    @spof = Spof.new(spof_params)

    respond_to do |format|
      if @spof.save
        format.html { redirect_to @spof, notice: "Spof was successfully created." }
        format.json { render :show, status: :created, location: @spof }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spof.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spofs/1 or /spofs/1.json
  def update
    respond_to do |format|
      if @spof.update(spof_params)
        format.html { redirect_to @spof, notice: "Spof was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @spof }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spof.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spofs/1 or /spofs/1.json
  def destroy
    @spof.destroy!

    respond_to do |format|
      format.html { redirect_to spofs_path, notice: "Spof was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spof
      @spof = Spof.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def spof_params
      params.expect(spof: [ :name, :label ])
    end
end
