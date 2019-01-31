class KondatelistsController < ApplicationController
  layout 'navmenu'
  def createKondate #=>受け取った期間の献立表の雛形を作成する
    if request.post? then
      @kondatelist_data = Kondatelist.all
      if @kondatelist_data.present? then #=>すでにKondateListが存在する場合はコメントを返す
        @msg = "すでに献立表が存在します。削除してから作り直してください！"
      else #=>受け取った期間でKondateListを作成
        (Date.parse(params[:startDate])..Date.parse(params[:endDate])).each do |data|
          Kondatelist.create(kondate_date: data)
        end
        @kondatelist_data = Kondatelist.all
        render "updateKondate"
      end
    end
    
  end

  def updateKondate
    if request.post? then
      if params[:allmenu] then #=>Menuの検索結果を返す
        @menu_data = Menu.all
      elsif params[:keyword]  then
        @menu_data = Menu.where('menu_name like ?', "%#{ params[:keyword] }%")
      else #=>Menuテーブルをidで検索しKondateListへ追加する
        obj = Menu.find( params[:id] )
        data = Kondatelist.find( params[:kondate_date] )
        data.update_attributes( kondate_name: obj.menu_name, kondate_url: obj.url, kondate_id: obj.id )
      end
    end
    @kondatelist_data = Kondatelist.all
    render "updateKondate"
  end

  def deleteKondate #=>KondateListとShoppingListを削除
    Kondatelist.delete_all
    ShoppingList.delete_all
    @msg = "献立表を削除しました！"
    render "createKondate"
  end

  def showKondate

    @shoppingList = ShoppingList.all.select("s_name , sum(s_quantity) as total_quantity, s_unit").group( :s_name )
    @kondatelist = Kondatelist.all

    if @shoppingList.present?
      render = "showKondate" and return
    else #=>KondateList内のMenuに紐づくMaterialListをShoppingListへ登録し、食材名でまとめて分量の合計を出す
      @kondatelist.each do |k|
        data = MaterialList.where( menu_id: k.kondate_id )
        data.each do |d|
          ShoppingList.create(s_name: d.material_name, s_quantity: d.quantity, s_unit: d.unit)
        end
      end
      @shoppingList = ShoppingList.all.select("s_name , sum(s_quantity) as total_quantity, s_unit").group( :s_name )
    end
      render = "showKondate" and return
  end
end
