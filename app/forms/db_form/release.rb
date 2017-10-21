class DbForm::Release
  # extend ActiveModel::Naming
  include ActiveModel::Dirty
  include ActiveModel::Model

  # associations
  delegate :price, :currency, :format, :released_at, :catalog_number, :note,
    :publisher_id, :publisher,
    to: :release
  attr_accessor :album, :release
  # class methods
  # validates
  validates :format, presence: true
  # callbacks
  # instance methods
  def release
    @release ||= Db::Release.new
  end

  def create(params, current_user)
    assign_latest(params)
    if valid?
      ActiveRecord::Base.transaction do
        clone_album_latest(current_user)
        assign_release_to_album_version
        log_action(:create, current_user)
      end
    end
  end

  def update(params, current_user)
    assign_latest(params)
    if valid?
      ActiveRecord::Base.transaction do
        clone_album_latest(current_user)
        assign_new_release
        log_action(:update, current_user)
      end
    end
  end

  def persisted?
    false
  end

private

  def assign_latest(params)
    release.assign_attributes(params)
  end

  def clone_album_latest(current_user)
    @album_latest = DbService::Album::CloneAlbumLatest
      .new(user: current_user, album: album)
      .perform
  end

  def assign_release_to_album_version
    @album_latest.update(release: release)
  end

  def log_action(action, current_user)
    method = "log_#{action}".to_sym
    album.send method,
      current_user,
      "発売情報・#{album.latest_version.title}",
      "#{album.latest_version.title}の新しい発売情報が作られました。"
  end

  def assign_new_release
    new_release = Db::Release.create(release.dup.attributes)
    @album_latest.update(release: new_release)
  end
end
