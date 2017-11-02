class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

	def index
		@users = User.all
	end

	def show
    @users = User.all
	end


	def new
    @user = User.new
  end

	def create
    @user = User.new(user_params)
    # set_input
    respond_to do |format|
      if @user.save!
        format.html { redirect_to [:admin, @user], notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

	def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to [:admin, @user], notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'users was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :role, :password_confirmation, :first_name, :last_name, :image, :is_active, :is_admin)
    end
    def set_input
      email = params[:user] && params[:user][:email] ? params[:user][:email].split("@").first : ""
      seperator = params[:user] && params[:user][:email] ? "_" : ""
      @user.password = SecureRandom.hex() if params[:user] && !params[:user][:password]
      @user.first_name = email + seperator + SecureRandom.hex(2) if params[:user] && !params[:user][:first_name]
    end
end