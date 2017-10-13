class Db::Company < ApplicationRecord
  include Db::Loggable
  
  has_many :company_versions
  belongs_to :latest_version,
    class_name: 'Db::CompanyVersion', optional: true
  has_many :releases
  has_and_belongs_to_many :albums,
    join_table: :db_albums_companies
end
