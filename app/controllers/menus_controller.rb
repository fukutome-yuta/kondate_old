class MenusController < ApplicationController
  def search
    if request.post? then
      @data = Menu.all
    else
      render "search"
    end
  end

  def edit
  end
end
