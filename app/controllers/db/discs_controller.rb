class Db::DiscsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!, only: [:destroy]
  before_action :db_sidebar

  def new
    set_title "新しいディスクを作る"
    @disc = Db::Disc.new
  end
  
  def create
    set_title "新しいディスクを作る"
    create_svc = DbService::Album::CreateDisc
      .new(params[:album_id], disc_params, current_user, description: params[:description])
      .perform
    @album = create_svc.album
    @disc = create_svc.disc
      
    unless create_svc.errors?
      redirect_to @album
    else
      render action: :new
    end
  end
  
  def edit
    set_title "ディスクを編集する"
    @disc = Db::Disc.find(params[:id])
  end
  
  def update
    set_title "ディスクを編集する"
    @disc = Db::Disc.includes(album_version: :album).find(params[:id])
    @latest = @disc.album_version
    @album = @latest.album
    @disc.assign_attributes(disc_params)
    
    if @disc.changed?
      unless @disc.save
        render action: :edit
      else
        @album.log_update(current_user, "ディスク#{@disc.number}・#{@latest.title}", params[:description])
        redirect_to @album
      end
    else
      redirect_to @album
    end
  end
  
  def destroy
    #code
  end
  
private

  def disc_params
    params.require(:db_disc).permit(:number, :title)
  end
end
