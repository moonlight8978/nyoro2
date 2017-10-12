class Db::ReleasesController < ApplicationController
  before_action :authenticate_user!
  before_action :db_sidebar
  
  def new
    set_title '発売情報を作る'
    @form = DbForm::ReleaseVersion.new
    @album = Db::Album.find(params[:album_id])
  end
  
  def create
    set_title '発売情報を作る'
    @album = Db::Album.find(params[:album_id])
    @form = DbForm::ReleaseVersion.new(album: @album)
    if @form.create(release_params, current_user)
      redirect_to @album
    else
      render action: :new
    end
  end
  
  def show
    @album = Db::Album.find(params[:album_id])
    @release = Db::Release.find(params[:id])
  end
  
  def edit
    set_title '発売情報を編集する'
    @album = Db::Album.find(params[:album_id])
    @form = DbForm::ReleaseVersion.new(
      album: @album, 
      release: @album.latest_version.release
    )
  end
  
  def update
    @album = Db::Album.find(params[:album_id])
    @form = DbForm::ReleaseVersion.new(
      album: @album, 
      release: @album.latest_version.release
    )
    if @form.update(release_params, current_user)
      redirect_to @album
    else
      render action: :edit
    end
  end
  
private

  def release_params
    params.require(:db_form_release_version).permit(
      :price, :currency, :format, 
      :released_at, :catalog_number, :note
    )
  end
end
