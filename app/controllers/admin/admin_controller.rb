class Admin::AdminController < ApplicationController
  # FIXME page title border bottom 1px solid #e7eaec !important
  # FIXME sidebar bg color #2f4050
  
  layout 'admin'
  before_action :authenticate_user!, :require_admin!
end
