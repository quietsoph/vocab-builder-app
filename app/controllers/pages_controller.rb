class PagesController < ApplicationController
  def home
    if @current_user.present?
      # <p>Welcome back <%= @current_user.email.split("@").first %></p>
      redirect_to roots_path
    else
      redirect_to login_path
    end
  end
end
