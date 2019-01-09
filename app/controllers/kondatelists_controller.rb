class KondatelistsController < ApplicationController
  def createKondate
    if request.post? then
      @kondatelist_data = Kondatelist.all
      if @kondatelist_data.present? then
        @msg = "すでに献立表が存在します。削除してから作り直してください！"
      else
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
      if params[:allmenu] then
        @menu_data = Menu.all
      elsif params[:keyword]  then
        @menu_data = Menu.where('menu_name like ?', "%#{ params[:keyword] }%")
      else
        obj = Menu.find( params[:id] )
        data = Kondatelist.find( params[:kondate_date] )
        data.update_attributes( kondate_name: obj.menu_name, kondate_url: obj.url, kondate_id: obj.id )
      end
    end
    @kondatelist_data = Kondatelist.all
    render "updateKondate"
  end

  def deleteKondate
    obj = Kondatelist.all
    obj.delete_all
    @msg = "献立表を削除しました！"
    render "createKondate"
  end

  def showKondate
  end
end
