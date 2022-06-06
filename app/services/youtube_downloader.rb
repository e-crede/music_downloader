# TODO: Youtube-DL throttling workaround
# TODO: multiple users executing the service handling - downloader should launch independent process
class YoutubeDownloader
  def initialize(object)
    @object = object
    @url = object[:url]
  end

  def to_mp3
    yt = IO.popen("#{mp3_params} #{@url}")
    output_old = nil
    loop do
      output = yt.gets.to_s
      output.match?('Destination:') ? save_name(output) : false
      # TODO: improve guard clause - add timeout
      break if output.nil? || output_old == output

      puts output
      output_old = output
    end
  end

  private

  # TODO: use json output to parse filename instead of regexp.
  def save_name(output)
    @object[:filename] = output.match('/assets/.*[.]').to_s << 'mp3'
    @object.save
  end

  def mp3_params
    bin_path = 'youtube-dl '
    name_template = "-o '#{Rails.root.join('public/assets')}/%(title)s.%(ext)s'"
    add_params = ' --no-color --newline -f bestaudio -x --audio-format mp3 --http-chunk-size 1048572 '
    bin_path + name_template + add_params
  end
end
