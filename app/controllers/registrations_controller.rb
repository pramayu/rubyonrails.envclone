class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      profile_dashboard_index_path(@user)
    end
end