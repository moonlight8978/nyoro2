class Admin::Db::CompaniesController < Admin::Db::VersionableListController
  def index
    @title = '発売者の管理'
    @title_en = 'Publishers management'
    super
  end
end
