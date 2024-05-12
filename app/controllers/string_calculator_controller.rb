class StringCalculatorController < ApplicationController
  def index
    if params[:numbers]
      begin
        @result = StringCalculatorService.add(params[:numbers])
      rescue RuntimeError => e
        @error = e.message
      end
    end
  end
end
