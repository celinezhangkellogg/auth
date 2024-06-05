class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create
    # authenticate the user
    # 1. try to find the user by their unique identifier
    @user = User.find_by({"email" => params["email"]})
    # 2. if the user exists -> check if they know their password
    if @user !=nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
    # 3. if they know their password (encrypted) -> login is successful


      # cookies
      cookies["monster"] = "me like cookies"
      # encryp cookies that no one can see/change
      session["user_id"] = @user["id"]
          


      flash["notice"] = "Welcome."
      redirect_to "/companies"
    # 4. if the user doesn't exist or they don't know their password -> login fails
      else
      # if want to limit number of attemps
      # @user["login_attempts"] = @user["login_attempts"]+1
      # @user.save
      flash["notice"] = "Nope."
      redirect_to "/login"
      end
    else
    flash["notice"] = "Nope."
    redirect_to "/login"
    end
  end

  def destroy
    # logout the user

    # delete the cookies
    session["user_id"] = nil
    
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
