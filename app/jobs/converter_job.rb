# Backend job to execute conversions
class ConverterJob < ApplicationJob
  queue_as :default
  around_perform :around_status

  def perform(object)
    @object = object
    YoutubeDownloader.new(@object).to_mp3
  end

  private

  def around_status
    yield
    #@object[:status] = 'FINISH'
    #@object.save
  end
end
