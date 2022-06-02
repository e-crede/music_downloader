class ProcessorsController < ApplicationController
  before_action :status_set, only: %i[ status ]

  def index
  end

  def convert
    # TODO: just render the same page, there should be a callback for after_execution to
    # update view via ajax call in a loop after x seconds: first with just loader, then with download link
    @object = Processor.new(url: params[:url])
    @object[:status] = 'START'
    respond_to do |format|
      if @object.save
        ConverterJob.perform_later(@object)
        format.html { redirect_to action: 'status', id: @object[:id] }
      else
        format.html { redirect_to processors_url, notice: 'Error!' }
      end
    end
  end

  def convert_now
    ConverterJob.perform_now(@object)
  end

  def status
  end

  private

  def status_set
    @object = Processor.find(params[:id])
  end
end
