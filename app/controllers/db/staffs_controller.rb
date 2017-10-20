class Db::StaffsController < ApplicationController
  # TODO destroy
  before_action :authenticate_user!
  before_action :db_sidebar

  def new
    @song = Db::Song.find(params[:song_id])
    @latest = Db::StaffVersion.new
    set_title "#{@song.latest_version.title}の新しいスタッフをつくる"
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
    backup_ui_variables(@song.latest_version.title, @song.latest_version.title_en)
  end

  def update
    update_svc = DbService::Song::UpdateStaff
      .new(params[:id], staff_params, current_user, description: params[:description])
      .perform

    @song = update_svc.song
    if update_svc.errors?
      backup_ui_variables(update_svc.title, update_svc.title_en)
      @staff = update_svc.staff
      @latest = update_svc.latest_version
      p @latest.errors
      render action: :edit
    else
      redirect_to @song
    end
  end

  def destroy
    #code
  end

private

  def backup_ui_variables(ja, en)
    set_title "#{ja}のスタッフを編集する"
    @page_title = ja
    @page_title_en = en
  end

  def staff_params
    params.require(:db_staff_version).permit(
      :position, :alias, :alias_en, :alias_pronounce, :note, :person_id
    )
  end
end
