class StaticPagesController < ApplicationController
  def home
    @full_page = true
  end
  
  def warning
    @no_navbar = true
    @no_footer = true
    @full_page = true
  end
end
