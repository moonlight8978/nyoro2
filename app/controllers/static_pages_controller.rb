class StaticPagesController < ApplicationController
  def home
    set_title :'ホーム'
    @album_count = Db::Album.all.count
    @person_count = Db::Person.all.count
    @user_count = User.all.count
    @full_page = true
  end
  
  def warning
    set_title :'年齢制限'
    @no_navbar = true
    @no_footer = true
    @full_page = true
  end
end
