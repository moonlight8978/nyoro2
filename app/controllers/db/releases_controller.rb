class Db::ReleasesController < ApplicationController
  before_action :authenticate_user!
  before_action :db_sidebar
  
  def new
    @form = DbForm::ReleaseVersion.new
    @album = Db::Album.find(params[:album_id])
  end
  
  def create
    @album = Db::Album.find(params[:album_id])
    @form = DbForm::ReleaseVersion.new(release_params.merge(album: @album))
    if @form.create_release
      redirect_to @form.release
    else
      render action: :new
    end
  end
  
  def edit
    @form = DbForm::ReleaseVersion.new(release_params.merge(album: @album))
  end
  
private

  def release_params
    params.require(:db_form_release_version).permit(
      :price, :currency, :format, 
      :released_at, :catalog_number, :note
    )
  end
end
