# TODO: decouple video conversion from frontend
# e.g. redirect immediately and  use turbo methods or js to fetch link / update downlaod state
class ProcessorsController < ApplicationController
  before_action :status_set, only: %i[status]

  def index
  end

  def convert
    @object = Processor.new(url: params[:url])
    @object[:status] = 'START'
    respond_to do |format|
      if @object.save
        ConverterJob.perform_now(@object)
        format.html { redirect_to action: 'status', id: @object[:id] }
      else
        format.html { redirect_to processors_url, notice: 'Error!' }
      end
    end
  end

  def status
  end

  private

  def status_set
    @object = Processor.find(params[:id])
  end
end
