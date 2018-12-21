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
      end
    end
    @kondatelist_data = Kondatelist.all
    render "createKondate"
  end

  def updateKondate
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
