class KondatelistsController < ApplicationController
  def createKondate
    if request.post? then
      @date = []
      (Date.parse(params[:startDate])..Date.parse(params[:endDate])).each do |date|
        @date.push(date)
      end
      render "createKondate"
    end
  end

  def updateKondate
  end

  def deleteKondate
  end

  def showKondate
  end
end
