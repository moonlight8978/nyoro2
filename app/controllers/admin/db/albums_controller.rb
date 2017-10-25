class Admin::Db::AlbumsController < Admin::Db::VersionableListController
  # TODO

  def index
    @title = 'アルバムの管理'
    @title_en = 'Albums management'
    super
  end
end
