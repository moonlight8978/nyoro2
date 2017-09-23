class Db::StaffVersionsController < ApplicationController
  def index
    @staff = Db::Staff.find(params[:staff_id])
    set_title "スタッフの編集履歴"
    @versions = @staff.versions
      .page(params[:page] || 1).per(params[:per] || 20)
      .group_by_day(&:created_at)
  end
  
  def update
    staff_id = params[:staff_id].to_i
    version_id = params[:id].to_i
    @staff = Db::Staff.find(staff_id)
    @song = @staff.song_versions.last.song
    
    if (@staff.latest_version_id === version_id)
      redirect_to db_song_versions_path(@staff) and return
    end
    
    @version = Db::StaffVersion.find(version_id)
    
    if (@version.staff_id === staff_id)
      @staff.update(latest_version_id: version_id)
      @song.log_update(current_user, @version.title, "バーション#{params[:id]}に戻す。")
    end
    
    redirect_to db_song_versions_path(@song)
  end
  
  def show
    #code
  end
  
  def destroy
    #code
  end
end
