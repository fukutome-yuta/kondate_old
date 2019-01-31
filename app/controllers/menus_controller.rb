class MenusController < ApplicationController
  layout 'navmenu'
  def search
    if request.post? then
      if params[:keyword] then #=> 入力されたkeywordでmenusテーブルを検索
        @data = Menu.new
        @data = Menu.where('menu_name like ?', "%#{ params[:keyword] }%")
        render "search"
      else #=> keywordがnilだったらmenusテーブルを全件検索
        @data = Menu.all
        render "search"
      end
    end
  end

=begin   def find
    @data = Array.new
    if request.post? then
      @data = Menu.where('menu_name like ?', "%#{ params[:keyword] }%")
      render "search"
    end  
  end 
=end

  def edit_menu #=> 編集対象のMenu ID を受け取り情報を返す
    @editMenu = Menu.new
    if request.post? then
      @editMenu = Menu.find(params[:id])
      #@materialData = MaterialList.where( menu_id: @editMenu.id )
      render "edit_menu"
    end
  end

  def update
    if params[:delete] then #=> deleteを受け取ったら対象のMenuを削除
      obj = Menu.find(params[:id])
      obj.destroy
      render "search"
    else #=> IDを受け取ったら対象のMenuを更新
      obj = Menu.find(params[:id])
      obj.update(material_params)
      obj.update_attributes( date: "" )
      render "search"
    end
  end

  def create_menu #=> Menuとそれに紐づくMaterialListを各テーブルへ登録
    @editMenu = Menu.new
    if request.post? then
      if Menu.create(material_params) then
        render "search" and return
      else #=> 登録に失敗したら同じ画面へ遷移
        render "create_menu" and return
      end
    end  
  end

  def delete #=> Menuとそれに紐づくMaterialListを削除
    obj = Menu.find(params[:id])
    obj.destroy
    render "search"
  end

  private
    def menu_params
      params.require(:menu).permit(:menu_name, :url)
    end
    def material_params #=>MenuとMaterialListの各カラムを検証
      params.require(:menu).permit(
        :menu_name, :url, :cook_date,
        material_lists_attributes: [:menu_id, :material_name, :quantity, :unit, :_destroy]
      )
    end
end
