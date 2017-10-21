class DbService::Album::CloneAlbumLatest
  def initialize(**args)
    @user, @album, @params = args[:user], args[:album], args[:params]
  end

  def perform
    build_latest
    assign_old_associations
    assign_to_album
    @latest
  end

private

  def build_latest
    params = (@params || @album.latest_version.dup.attributes)
      .merge({
        previous_version: @album.latest_version,
        image: (@params && @params[:image]) || @album.latest_version.image,
        editor: @user
      })
    @latest = @album.album_versions.create(params)
  end

  def assign_old_associations
    assign_discs
    @album.latest_version.release && assign_release_and_publishers
    @latest.save
  end

  def assign_discs
    @latest.disc_ids = @album.latest_version.disc_ids
  end

  def assign_release_and_publishers
    @latest.release = @album.latest_version.release
    @album.publisher_ids = [@album.latest_version.release.publisher_id]
  end

  def assign_to_album
    @album.update(latest_version: @latest)
  end
end
