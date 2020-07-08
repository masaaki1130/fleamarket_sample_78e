module Users
  class RegistrationsController < Devise::RegistrationsController
    # before_action :configure_permitted_parameters, only: [:create]
    # before_action :configure_account_update_params, only: [:update]

    # GET /resource/sign_up
    def new
      @user = User.new
    end

    def create
      @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.addresses.new
    render :new_destinations
    end

    def create_destinations
      @user = User.new(session["devise.regist_data"]["user"])
      @address = @user.addresses.new(destination_params)
      unless @address.valid?
        flash.now[:alert] = @address.errors.full_messages
        render :new_destinations and return
      end
      @user.save
      @address.save
      session["devise.regist_data"]["user"].clear
      sign_in(:user, @user)
    end

    protected

    def destination_params
      params.require(:address).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :postal, :prefecture_id, :city, :house_number, :building_name, :phone_number)
    end
  end
end
