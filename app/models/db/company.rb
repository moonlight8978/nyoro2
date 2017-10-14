class Db::Company < ApplicationRecord
  include Db::Loggable
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
end
