class Db::AlbumVersion < ApplicationRecord
  after_initialize :set_default_values

  include Db::Validators::Title
  include ImageUploadable
  include Db::TrackEditor

  belongs_to :album,
    class_name: 'Db::Album', optional: true
  belongs_to :previous_version,
    class_name: 'Db::AlbumVersion', optional: true
  belongs_to :release,
    optional: true
  has_and_belongs_to_many :discs,
    join_table: :db_album_versions_discs

  scope :version_list,
    -> {
      select(:id, :previous_version_id, :album_id, :created_at)
      .order(created_at: :desc)
    }



  def released_at
    DateValue.new(release && release.released_at)
  end

private

  def set_default_values
    self.marked = false
  end
end
