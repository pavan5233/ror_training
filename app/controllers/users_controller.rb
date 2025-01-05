class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def index
        @users = User.all
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_path, notice: "User created successfully!"
        else
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params) # Update user attributes.
            redirect_to users_path, notice: "User updated successfully!"
        else
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            redirect_to users_path, notice: "User deleted successfully!"
        else
            redirect_to users_path, alert: "Failed to delete the user!"
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :phone_number, :password)
    end
end
