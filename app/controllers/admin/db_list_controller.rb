class Admin::DbListController < Admin::AdminController
  # TODO

  def albums_list
    @albums = Db::Album.all
      .includes(latest_version: :editor)
      .page(params[:page] || 1)
      .per(params[:per_page] || 20)
  end
end
