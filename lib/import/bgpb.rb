module Import
  class Bgpb
    DOC_START_REGEXP = /^NDoc=.*/
    DOC_END_REGEXP = /^KorName=.*/
    DOC_ATTR_REGEXP = /^(?<attr_name>\w+)=(?<attr_value>.*)/
    class << self
      def parse(file)
        docs = []
        bgpb_file = Import::BgpbFile.new(file)

        while doc = next_doc(bgpb_file)
          docs << doc
        end
        docs
      end

      def next_doc(file)
        doc = nil
        while true
          line = file.readrow
          if line =~ DOC_START_REGEXP
            fail "TRYING TO START TWICE! #{current_doc}; #{line}" if doc
            doc = {}
          end

          if doc
            matches = DOC_ATTR_REGEXP.match(line)

            puts "LINE #{line}" unless matches

            if matches && matches[:attr_name]
              fail "TRYING TO OVERRIDE CURRENT DOC ATTRIBUTE #{matches[:attr_name]}(current_doc[matches[:attr_name]]) WITH #{matches[:attr_value]}" if doc[matches[:attr_name]]
              doc[matches[:attr_name]] = typecast_value(matches[:attr_value])
            end
          end

          return doc if line =~ DOC_END_REGEXP
        end
      rescue EOFError => e
        nil
      end

      def typecast_value(val)
        return val.to_f if val =~ /^\d+\.\d+$/
        return Date.parse(val) if val =~ /^\d{1,2}\.\d{1,2}\.\d{1,4}$/
        val
      end
    end
  end
end
