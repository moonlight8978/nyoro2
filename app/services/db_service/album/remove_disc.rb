class DbService::Album::RemoveDisc
  attr_reader :album

  def initialize(album_version_id, disc_id, current_user, **optionals)
    @album_version = Db::AlbumVersion.find(album_version_id)
    @album = @album_version.album
    @disc = Db::Disc.find(disc_id)
    @current_user = current_user
    @optionals = optionals
  end

  def perform
    return self unless user_request_to_edit_latest_version?

    ActiveRecord::Base.transaction do
      clone_album_latest
      remove_disc
      log_destroy_action
    end

    self
  end

private

  def user_request_to_edit_latest_version?
    @album_version == @album.latest_version
  end

  def clone_album_latest
    @album_latest = DbService::Album::CloneAlbumLatest
      .new(user: @current_user, album: @album)
      .perform
  end

  def remove_disc
    @album_latest.discs.destroy(@disc.id)
  end

  def log_destroy_action
    @album.log_destroy(
      @current_user,
      "ディスク#{@disc.number}",
      @optionals[:description]
    )
  end
end
