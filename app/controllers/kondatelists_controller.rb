class KondatelistsController < ApplicationController
  def createKondate
    if request.post? then
      @date = []
      (Date.parse(params[:startDate])..Date.parse(params[:endDate])).each do |date|
        @date.push(date)
        Kondatelist.create(kondate_date: date)
      end
    else
      @date = Kondatelist.select("kondate_date")
    end
    render "createKondate"
  end

  def updateKondate
  end

  def deleteKondate
    obj = Kondatelist.all
    obj.destroy
    @msg = "献立表を削除しました！"
    render "createKondate"
  end

  def showKondate
  end
end
