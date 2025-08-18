class SessionsController < ApplicationController

    def login
        @errors = false
    end

    def create
        user = User.find_by(email: params[:session][:email])

        if !user
            @errors = ["User not found."]
            respond_to do |format|
            format.html { render :new }
            end
        else
            password = BCrypt::Password.new(user.password)

            if password == params[:session][:password]
             session[:user_id] = user.id
             respond_to do |format|
                format.html { redirect_to user, notice: "Login successfully.", status: :see_other }
             end
            # ممكن تضيف redirect أو session هنا
            else
             @errors = ["Wrong password."]
             respond_to do |format|
                format.html { render :new }
             end
            end
        end
    end

    def destroy
        session[:user_id] = nil
        respond_to do |format|
            format.html { redirect_to root_path, notice: "Loged out.", status: :see_other }
        end
    end
    
end
# poda10@poda.po
# 1111poda