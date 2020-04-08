class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render text: :exception, status: 500
  end

  def after_sign_in_path_for(_resource)
    systems_path
  end
end
