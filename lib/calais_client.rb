
require 'rubygems'
require 'json'
require 'lib/rest_client'

class CalaisClient < Object 
    LICENSE_ID = YAML::load_file('keys.yml')['calais']
    C_URI = URI.parse('http://api.opencalais.com/enlighten/rest/')
 
    def get_from_calais(content)
        post_args = { 'licenseID' => LICENSE_ID, 'content' => content, 'paramsXML' => paramsXML('application/json') }
        post_to(C_URI, post_args)
    end
  
    def get_tag_from_json(response)
        result = JSON.parse response
        result.delete_if {|key, value| key == "doc" } # ditching the doc
        result.each do |key,tag|
            tag = clean_unwanted_items_from_hash tag
            yield tag
        end
        result
    end
 
    def clean_unwanted_items_from_hash h
        h.delete_if {|k, v| k == "relevance" }
        h.delete_if {|k, v| k == "instances" }
        h.delete_if {|k,v| v == "N/A"}
        h.delete_if {|k,v| v == []}
        h.delete_if {|k,v| v == ""}
        h
    end
                                
  private
               
    def paramsXML(format)
        <<-paramsXML;
            <c:params xmlns:c="http://s.opencalais.com/1/pred/"
              xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
                <c:processingDirectives
                  c:contentType="text/txt"
                  c:outputFormat="#{format}">
                </c:processingDirectives>
                <c:userDirectives />
                <c:externalMetadata />
            </c:params>
        paramsXML
    end
end

