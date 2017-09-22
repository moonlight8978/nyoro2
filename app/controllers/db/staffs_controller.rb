class Db::StaffsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @song = Db::Song.find(params[:song_id])
    @latest = Db::StaffVersion.new
  end
  
  def create
    create_svc = DbService::Song::CreateStaff
      .new(params[:song_id], staff_params, current_user, description: params[:description])
      .perform
    @song = create_svc.song
    
    if create_svc.errors?
      @latest = create_svc.latest_version
      render action: :new
    else
      redirect_to @song
    end
  end
  
  def edit
    @staff = Db::Staff.find(params[:id])
    @song = @staff.song_versions.first.song
    @latest = @staff.latest_version
  end
  
  def update
    update_svc = DbService::Song::UpdateStaff
      .new(params[:id], staff_params, current_user, description: params[:description])
      .perform
    
    if update_svc.errors?
      @staff = update_svc.staff
      @latest = update_svc.latest_version
      render action: :edit
    else
      redirect_to update_svc.song
    end
  end
  
  def destroy
    #code
  end
  
private
  
  def staff_params
    params.require(:db_staff_version).permit(
      :person_id, :position, :alias, :alias_en, :alias_pronounce, :note,
      { person: :id }
    )
  end
end
