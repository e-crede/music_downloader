# Calls backend service to download Youtube files
class YoutubeDownloader
  # FIXME: use attr_reader instead of instance var
  attr_reader :url

  def initialize(object)
    @object = object
    @url = object[:url]
  end

  def to_mp3
    # TODO: test - confirm that execution of multiple service instances works
    yt = IO.popen("#{mp3_params} #{@url}")

    output_old = nil
    loop do
      output = yt.gets
      # TODO: improve guard clause - add timeout
      break if output.nil? || output_old == output

      @object[:status] = output
      @object.save
      puts output
      output_old = output
    end
  end

  def mp3_params
    # TODO: full path to youtube-dl executable
    bin_path = 'youtube-dl '
    name_template = "-o '#{Rails.root.join('storage')}/%(title)s.%(ext)s'"
    add_params = ' --no-color --newline -f bestaudio -x --audio-format mp3 --http-chunk-size 1048572'
    bin_path + name_template + add_params
  end
end
