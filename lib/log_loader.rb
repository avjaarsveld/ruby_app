class LogLoader

  def initialize(filename)
    @filename = filename
    raise ArgumentError unless File.exists?(filename)
  end

  # Some of the contents of this method could have been split into another (privagte) method,
  # etc. I tried to keep things simple however.
  def data
    file_contents = {}
    File.read(@filename).split("\n").each do |line|
      url = line.split(' ').first
      ip_address = line.split(' ').last
      file_contents[url] = [] unless file_contents.has_key? url
      file_contents[url] << ip_address
    end
    file_contents
  end

end