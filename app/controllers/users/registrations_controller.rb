# frozen_string_literal: true
class Users
  class RegistrationsController < Devise::RegistrationsController
    # before_action :configure_permitted_parameters, only: [:create]
    # before_action :configure_account_update_params, only: [:update]

    # GET /resource/sign_up
    def new
      @user = User.new
    end
  end
end