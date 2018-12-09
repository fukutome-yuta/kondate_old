class MenusController < ApplicationController
  def search
    if request.post? then
      @data = Menu.all
    else
      render "search"
    end
  end

  def find
    @data = Array.new
    if request.post? then
      @data = Menu.where('menu_name like ?', "%#{ params[:keyword] }%")
      render "search"
    end  
  end


  def edit
  end
end
