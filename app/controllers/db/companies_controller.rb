class Db::CompaniesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @companies = Db::Company.all
  end
  
  def new
    @form = DbForm::Company.new
  end
  
  def create
    @form = DbForm::Company.new
    if @form.save(:create, company_params, current_user)
      
    else
      p @form.errors
      render :new
    end
  end
  
private

  def company_params
    params.require(:db_form_company).permit(
      :country_id, :name, :name_en, :name_pronounce, :established_at, :note
    )
  end
end
