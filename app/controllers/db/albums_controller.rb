class Db::AlbumsController < ApplicationController
  # TODO destroy
  before_action :authenticate_user!, except: [:show, :index, :search]
  before_action :require_admin!, only: [:destroy]
  before_action :db_sidebar

  def new
    set_title '新しいアルバムを作る'
    @latest = Db::AlbumVersion.new
  end

  def create
    set_title '新しいアルバムを作る'
    create_svc = DbService::Album::CreateAlbum
      .new(album_params, current_user, description: params[:description])
      .perform
    @album = create_svc.album

    unless create_svc.errors?
      redirect_to @album
    else
      @latest = create_svc.latest_version
      render 'new'
    end
  end

  def show
    @album = Db::Album
      .includes(
        latest_version: {
          discs: {
            songs: {
              latest_version: { staffs: { latest_version: { person: :latest_version } } }
            }
          },
          release: :publisher
        },
        ratings: :rated_user
      )
      .find(params[:id])
    @latest = @album.latest_version
    set_title @latest.title
  end

  def index
    set_title 'アルバムリスト'

    _order = params[:sort].present? ? params[:sort] : :title_pronounce
    _direction = params[:reverse_sort].present? ? :desc : :asc
    @albums = DbQuery::Album
      .new
      .sort(_order, _direction)
      .page(params[:page] || 1)
      .per(params[:per_page] || 10)
  end

  def edit
    @album = Db::Album.includes(:latest_version).find(params[:id])
    @latest = @album.latest_version
    backup_ui_variables(@latest.title, @latest.title_en)
  end

  def update
    update_svc = DbService::Album::UpdateAlbum
      .new(params[:id], album_params, current_user, description: params[:description])
      .perform
    @album = update_svc.album

    unless update_svc.errors?
      redirect_to @album
    else
      backup_ui_variables(update_svc.title, update_svc.title_en)
      @latest = update_svc.latest_version
      render 'edit'
    end
  end

  def destroy
    #codes
  end

  def search
    set_title "Search results for #{params[:q]}"
    search = Db::Album.search do
      keywords params[:q], highlight: true
      order_by(:title_pronounce, :asc)
      paginate(page: params[:page] || 1, per_page: params[:per_page] || 10)
    end

    @albums = search.results

    respond_to do |format|
      format.html
      format.js do
        render partial: 'components/livesearch', locals: {
          results: @albums, no_img: false
        }
      end
    end
  end

private

  def backup_ui_variables(ja, en)
    set_title "#{ja}を編集する"
    @page_title = ja
    @page_title_en = en
  end

  def album_params
    params.require(:db_album_version).permit(
      :title, :title_en, :title_pronounce, :image, :note
    )
  end

  def render_logs
    logs = Feature::Log.db_log.page(1).per(10)
    render_to_string partial: 'components/logs', locals: { logs: logs }
  end
end
