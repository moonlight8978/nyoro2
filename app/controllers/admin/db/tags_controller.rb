class Admin::Db::TagsController < Admin::Db::ListController
  def index
    @title = 'タグの管理'
    @title_en = 'Tags management'
    super
  end
end
