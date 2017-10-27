class Db::RecentActivitiesController < ApplicationController
  before_action :db_sidebar
  decorates_assigned :activities

  def index
    set_title '最近の活動'
    @activities = Feature::Log
      .includes(:loggable, :user)
      .all
      .page(params[:page] || 1)
      .per(params[:per_page] || 25)
  end
end
