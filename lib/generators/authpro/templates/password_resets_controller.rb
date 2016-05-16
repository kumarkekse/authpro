class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email]

    if user
      user.prepare_password_reset
      UserMailer.password_reset(user).deliver
      redirect_to root_url, notice: "Email sent with password reset instructions."
    else
      flash.now.alert = "We could not find anyone with that email address."
      render "new"
    end
  end

  def edit
    @user = User.find_by! password_reset_token: params[:id]
  end

  def update
    @user = User.find_by! password_reset_token: params[:id]
    if @user.password_reset_sent_at < 20.hours.ago
      redirect_to new_password_reset_path, alert: "Password reset has expired."
    elsif @user.update_attributes(user_params)
      redirect_to root_url, notice: "Password has been reset."
    else
      render :edit
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
