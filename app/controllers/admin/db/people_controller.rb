class Admin::Db::PeopleController < Admin::Db::VersionableListController
  def index
    @title = 'スタッフの管理'
    @title_en = 'Staffs management'
    super
  end
end
