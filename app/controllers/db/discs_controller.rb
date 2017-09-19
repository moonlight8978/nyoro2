class Db::DiscsController < ApplicationController
  before_action :db_sidebar
  before_action :authenticate_user!
  before_action :require_admin!, only: [:destroy]
  before_action :new_title, only: [:new, :create]
  
  def new
    @disc = Db::Disc.new
  end
  
  def create
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
    @disc = Db::Disc.find(params[:id])
  end
  
  def update
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
  
  def new_title
    @title = "新しいディスクを作る"
  end
end
