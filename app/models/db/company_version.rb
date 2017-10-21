class Db::CompanyVersion < ApplicationRecord
  include MemberOfCountry
  include AliasTitle
  include Db::TrackEditor

  belongs_to :company,
    optional: true
  belongs_to :previous_version,
    class_name: 'Db::CompanyVersion', optional: true

  scope :version_list,
    -> {
      select(:id, :previous_version_id, :company_id, :created_at)
      .order(created_at: :desc)
    }
end
