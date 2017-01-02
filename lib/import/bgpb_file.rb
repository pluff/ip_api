module Import
  class BgpbFile
    def initialize(file)
      @file = file
    end

    def readrow
      line = @file.readline("^\r\n")
      line.gsub!("^\r\n", "")
      line.gsub!("\r\n", "")
      line.gsub!(/^\^/, '')
      line
    end
  end
end
