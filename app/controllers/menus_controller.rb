class MenusController < ApplicationController
  def search
    @data = Menu.all
  end

  def edit
  end
end
