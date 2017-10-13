class Db::CompaniesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    set_title ""
    @companies = Db::Company.includes(:latest_version).all
  end
  
  def new
    set_title ""
    @form = DbForm::Company.new
  end
  
  def create
    set_title ""
    @form = DbForm::Company.new
    if @form.save(:create, company_params, current_user)
      redirect_to @form.company
    else
      render :new
    end
  end
  
  def show
    set_title ""
    @company = Db::Company.find(params[:id])
  end
  
  def edit
    set_title ""
    @company = Db::Company.find(params[:id])
    @form = DbForm::Company.new(company: @company, latest: @company.latest_version)
  end
  
  def update
    set_title ""
    @company = Db::Company.find(params[:id])
    @form = DbForm::Company.new(company: @company, latest: @company.latest_version)
    if @form.save(:update, company_params, current_user)
      redirect_to @company
    else
      render :edit
    end
  end
  
  def destroy
    #code
  end
  
private

  def company_params
    params.require(:db_form_company).permit(
      :country_id, :name, :name_en, :name_pronounce, :established_at, :note
    )
  end
end
