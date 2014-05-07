Puppet::Parser::Functions::newfunction(:remote_template, :type => :rvalue, :doc =>
  "Evaluate template(s) fetched from a URL and return its value.") do |vals|

  require 'erb'
  require 'open-uri'

    vals.collect do |url|
      content = ""
      begin
        open(url) {|f|
          content = f.read()
        }
      rescue => detail
        raise Puppet::ParseError,
          "Failed to fetch remote template at #{url}: #{detail}"
      end

      wrapper = Puppet::Parser::TemplateWrapper.new(self)
      begin
        wrapper.result(content)
      rescue => detail
        raise Puppet::ParseError,
          "Failed to parse remote template at #{url}: #{detail}"
      end
    end.join("")
end