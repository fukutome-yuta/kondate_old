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
    if request.post? then
      @data = Menu.find(params[:id])
      render "edit"
    end
  end

  def update
    obj = Menu.find(params[:id])
    obj.update(menu_params)
    obj.update_attributes( date: "", check: false )
    @msg = "メニューリストを更新しました！"
    render "search"
  end

  def new
    @data = Menu.new
    render "edit"
  end 

  def add
    if request.post? then
      Menu.create(menu_params)
    end
    @msg = "メニューリストを更新しました！"
    render "search"
  end

  def delete
    obj = Menu.find(params[:id])
    obj.destroy
    @msg = "メニューリストから削除しました！"
    render "search"
  end

  private
  def menu_params
    params.require(:menu).permit(:menu_name, :url)
  end
end
