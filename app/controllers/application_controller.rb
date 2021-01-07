class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :has_access
  helper_method :is_admin?

  def active_ids
    User.all.map{|user|user.id}
  end

  def valid_session?
    active_ids.any?(session[:user_id])
  end

  # Defines the current user exists, and sets equal to session user
  def current_user
    if valid_session?
      User.find(session[:user_id])
    end
  end

  # Defines if a user has access to this page. Is true for admin and logged in users.
  def is_admin?
    if valid_session?
      current_user.admin == true
    end
  end

  def has_access(id)
    if valid_session?
      is_admin? || id == current_user.id
    end
  end

  def welcome
  end

end
