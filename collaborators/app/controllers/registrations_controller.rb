class RegistrationsController < Devise::RegistrationsController

    private

    def sign_up_params
        print("sign_up_params\n")
        params.require(:user).permit( :name, 
                                    :email, 
                                    :password, 
                                    :password_confirmation)
    end

    def account_update_params
        params.require(:user).permit( :name, 
                                    :email, 
                                    :password, 
                                    :password_confirmation, 
                                    :current_password)
    end
end