class DbForm::Company
  include ActiveModel::Dirty
  include ActiveModel::Model
  include Db::Validators::Name
  
  attr_accessor :company, :latest
  
  delegate :country_id, :country, :name, :name_en, :name_pronounce, :established_at, :note,
    to: :latest
  
  validates :country,
    if: -> { country_id || country },
    presence: { message: 'この国がデータベースには存在しませんでした。' }
  
  def latest
    @latest ||= Db::CompanyVersion.new
  end
  
  def save(action, params, current_user)
    latest.assign_attributes(params)
    if valid?
      ActiveRecord::Base.transaction do
        send(:"#{action}_company")
        @company.send :"log_#{action}", 
          current_user, 
          latest.name, 
          "#{latest.name}を作りました。"
      end
    end
  end

private
  
  def create_company
    @company = Db::Company.create()
    latest.update(company: @company)
    @company.update(latest_version: latest)
  end
  
  def update_company
    p latest.dup
    latest = @company.company_versions.build(@latest.dup.attributes)
    latest.update_attributes(
      previous_version: latest
    )
    @company.update(latest_version: latest)
  end
end