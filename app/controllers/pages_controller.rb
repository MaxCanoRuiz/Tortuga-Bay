class PagesController < ApplicationController
  before_action :authenticate_user!
  include Pundit
  def home
  end
end
