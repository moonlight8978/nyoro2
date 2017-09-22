class Db::PersonVersionsController < ApplicationController
  before_action :authenticate_user!
  before_action :db_sidebar
  
  def index
    @person = Db::Person.find(params[:person_id])
    @versions = @person.versions.page(1).per(20).group_by_day(&:created_at)
    set_title "#{@person.latest_version.name}の編集履歴"
  end
  
  def show
    @current_version = Db::PersonVersion.find(params[:id])
    @person = @current_version.person
    set_title "#{@person.latest_version.name}のバージョン#{params[:id]}"
  end
  
  def update
    version_id = params[:id].to_i
    person_id = params[:person_id].to_i
    
    @person = Db::Person.find(person_id)
    
    if (@person.latest_version_id === version_id)
      redirect_to db_person_versions_path and return
    end
    
    @version = Db::PersonVersion.find(version_id)
    
    if (@version.person_id === person_id)
      @person.update(latest_version_id: version_id)
      @person.log_update(current_user, @version.name, "バーション#{params[:id]}に戻す。")
    end
    
    redirect_to db_person_versions_path
  end
  
  def destroy
    #code
  end
end
