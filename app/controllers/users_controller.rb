class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_same_user, only: %i[ edit update destroy ]

  # GET /Users or /Users.json
  def index
    @users = User.all
  end

  # GET /Users/1 or /Users/1.json
  def show
  end

  # GET /Users/new
  def new
    @user = User.new
  end

  # GET /Users/1/edit
  def edit
  end

  # POST /Users or /Users.json
  def create
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to articles_path, notice: "Welcome in PODAWEP #{@user.username} ,User was successfully created." }
        format.json { render :show, status: :created, location: @User }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @User.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Users/1 or /Users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Users/1 or /Users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to Users_path, notice: "User was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:id].present?
      @user = User.find(params[:id]) 
      else
      @user = cur_user
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      # permitted = [:username, :email,:admin]
      permitted = [:username, :email]
      permitted << :password unless params[:user][:password].blank?
      params.require(:user).permit(permitted)
    end

    def require_same_user
      if cur_user != @user && !cur_user.admin
        redirect_to @user
      end
    end
end
