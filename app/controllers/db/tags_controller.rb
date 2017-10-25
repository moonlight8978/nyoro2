class Db::TagsController < ApplicationController
  include Db::Destroyable

  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :db_sidebar

  def index
    set_title 'タグ'
    @tags = Db::Tag.all
  end

  def new
    set_title '新しいタグを作る'
    @tag = Db::Tag.new
  end

  def create
    set_title '新しいタグを作る'
    @tag = Db::Tag.new(tag_params)
    @tag.editor = current_user

    unless @tag.save
      render action: :new
    else
      @tag.log_create(current_user, @tag.name, params[:description])
      redirect_to @tag
    end
  end

  def show
    @tag = Db::Tag.find(params[:id])
    set_title "#{@tag.name}・タグ"
  end

  def edit
    @tag = Db::Tag.find(params[:id])
    backup_ui_variables(@tag.name, @tag.name_en)
  end

  def update
    @tag = Db::Tag.find(params[:id])
    backup_ui_variables(@tag.name, @tag.name_en)
    @tag.assign_attributes(tag_params)
    if @tag.changed? && !@tag.save
      render action: :edit and return
    end
    @tag.update(editor: current_user)
    redirect_to @tag
  end

  def search
    q = params[:q]
    @search = Db::Tag.search do
      keywords q
    end

    @tags = @search.results

    respond_to do |format|
      format.html
      format.js
    end
  end

private

  def backup_ui_variables(ja, en)
    set_title "#{ja}を編集する"
    @page_title = ja
    @page_title_en = en
  end

  def tag_params
    params.require(:db_tag).permit(
      :name, :name_en, :name_pronounce, :description
    )
  end
end
