class Db::Person < ApplicationRecord
  include Db::Loggable
  include Commentable
  include AliasTitle
  include Db::MarkDestroy

  delegate :title, to: :latest_version

  belongs_to :latest_version,
    class_name: 'Db::PersonVersion', optional: true
  has_many :person_versions
  has_many :staff_versions
  has_many :versions,
    -> { version_list }, class_name: 'Db::PersonVersion'

  searchable do
    text :title, boost: 2, :stored => true do
      latest_version.name
    end
    text :title_en, boost: 2, :stored => true do
      latest_version.name_en
    end
    text :title_pronounce, :stored => true do
      latest_version.name_pronounce
    end
    text :twitter do
      latest_version.twitter
    end
    text :website do
      latest_version.website
    end
    string :marked do
      marked ? 'pending' : 'active'
    end
  end
end
