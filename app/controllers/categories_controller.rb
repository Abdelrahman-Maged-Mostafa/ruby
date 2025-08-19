class CategoriesController < ApplicationController
  before_action :set_cate, only: %i[ show edit update destroy ]
  before_action :require_admin, except: %i[ show index ]

  # GET /spofs or /spofs.json
  def index
    @cates = Category.all
  end

  # GET /spofs/1 or /spofs/1.json
  def show
  end

  # GET /spofs/new
  def new
    @cate = Category.new
  end

  # GET /spofs/1/edit
  def edit
  end

  # POST /spofs or /spofs.json
  def create
    @cate = Category.new(cate_params)

    respond_to do |format|
      if @cate.save
        format.html { redirect_to @cate, notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @cate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spofs/1 or /spofs/1.json
  def update
    respond_to do |format|
      if @cate.update(cate_params)
        format.html { redirect_to @cate, notice: "category was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @cate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spofs/1 or /spofs/1.json
  def destroy
    @cate.destroy!

    respond_to do |format|
      format.html { redirect_to spofs_path, notice: "Spof was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cate
      @cate = Category.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cate_params
      params.require(:category).permit(:name)
    end
    
    def require_admin
      unless logged_in?
        redirect_to login_path, alert: "Please log in first.", status: :see_other
        return
      end

      unless cur_user.admin?
        redirect_to categories_path, alert: "You must be an admin to access this page.", status: :see_other
      end
    end
end
