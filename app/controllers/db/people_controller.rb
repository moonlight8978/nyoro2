class Db::PeopleController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :db_sidebar
  
  def new
    set_title :'新しいスタッフを作る'
    @latest = Db::PersonVersion.new
  end
  
  def create
    set_title :'新しいスタッフを作る'
    
    create_svc = DbService::Person::CreatePerson
      .new(person_params, current_user, description: params[:description])
      .perform
    
    if create_svc.errors?
      @latest = create_svc.latest_version
      render action: :new
    else
      redirect_to create_svc.person
    end
  end
  
  def show
    @person = Db::Person.find(params[:id])
    @latest = @person.latest_version
    set_title @latest.name
  end
  
  def edit
    @person = Db::Person.find(params[:id])
    @latest = @person.latest_version
    back_up_ui_variables(@latest.name, @latest.name_en)
  end
  
  def update
    update_svc = DbService::Person::UpdatePerson
      .new(params[:id], person_params, current_user, description: params[:description])
      .perform
    @person = update_svc.person
    
    if update_svc.errors?
      back_up_ui_variables(update_svc.name, update_svc.name_en)
      @latest = update_svc.latest_version
      render action: :edit
    else
      redirect_to @person
    end
  end
  
  def index
    set_title :'スタッフリスト'
    @people = Db::Person
      .includes(:latest_version)
      .all
      .page(params[:page] || 1)
      .per(params[:per_page] || 10)
  end
  
  def destroy
    #code
  end
  
private

  def back_up_ui_variables(ja, en)
    set_title "#{ja}を編集する"
    @page_title = ja
    @page_title_en = en
  end
  
  def person_params
    params.require(:db_person_version).permit(
      :name, :name_en, :name_pronounce, :birthday, :website, :twitter, :note,
      :gender, :blood_type
    )
  end
end
