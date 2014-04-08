require 'rexml/document'

module IISParser
  class << self

    def parse_log_dir xml_str
      raise ArgumentError, 'xml_str is null' unless xml_str

        doc = REXML::Document.new xml_str
        REXML::XPath.first(doc,
           '//siteDefaults/logFile/@directory').
          to_s.
          gsub('%','').
          gsub(/SystemDrive/) {|v| ENV[v] }
    end
  end
end
