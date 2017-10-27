class Db::Company < ApplicationRecord
  include Db::Loggable
  include Commentable
  include Db::MarkDestroy

  delegate :title, to: :latest_version
  has_many :company_versions
  belongs_to :latest_version,
    class_name: 'Db::CompanyVersion', optional: true
  has_many :releases,
    foreign_key: :publisher_id
  has_and_belongs_to_many :albums,
    join_table: :db_albums_companies
  has_many :versions,
    -> { version_list }, class_name: 'Db::CompanyVersion'

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
    text :editor do
      latest_version.editor.user_name || ''
    end
    string :marked do
      marked ? 'pending' : 'active'
    end
  end
end
