class RegistrationsController < Devise::RegistrationsController
  private

  # Checks if the user is signed in
  def sign_up_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

  #   Triggers when the player tries to update account settings
  def account_update_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :current_password)
  end
end
