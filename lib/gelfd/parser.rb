module Gelfd
  class Parser

    def self.parse(data)
      header = data[0..1]
      case header
      when ZLIB_MAGIC
        ZlibParser.parse(data)
      when CHUNKED_MAGIC
        ChunkedParser.parse(data)
      when GZIP_MAGIC
        GzipParser.parse(data)
      when UNCOMPRESSED_MAGIC
        data[2..-1]
      else
        raise UnknownHeaderError, "Could not find parser for header: #{header.unpack('C*').to_s}"
      end
    end

  end
end


