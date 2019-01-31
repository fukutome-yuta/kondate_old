class MenusController < ApplicationController
  layout 'navmenu'
  def search
    if request.post? then
      if params[:keyword] then
        @data = Menu.new
        @data = Menu.where('menu_name like ?', "%#{ params[:keyword] }%")
        render "search"
      else
        @data = Menu.all
        render "search"
      end
    end
  end

  def find
    @data = Array.new
    if request.post? then
      @data = Menu.where('menu_name like ?', "%#{ params[:keyword] }%")
      render "search"
    end  
  end

  def edit_menu
    @editMenu = Menu.new
    if request.post? then
      @editMenu = Menu.find(params[:id])
      #@materialData = MaterialList.where( menu_id: @editMenu.id )
      render "edit_menu"
    end
  end

  def update
    if params[:delete] then
      obj = Menu.find(params[:id])
      obj.destroy
      @msg = "メニューリストから削除しました！"
      render "search"
    else
      obj = Menu.find(params[:id])
      obj.update(material_params)
      obj.update_attributes( date: "" )
      @msg = "メニューリストを更新しました！"
      render "search"
    end
  end

  def create_menu
    @editMenu = Menu.new
    if request.post? then
      if Menu.create(material_params) then
        render "search" and return
      else
        render "create_menu" and return
      end
    end  
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
    def material_params
      params.require(:menu).permit(
        :menu_name, :url, :cook_date,
        material_lists_attributes: [:menu_id, :material_name, :quantity, :unit, :_destroy]
      )
    end
end
