class Admin::AdminController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!, :require_admin!
end
