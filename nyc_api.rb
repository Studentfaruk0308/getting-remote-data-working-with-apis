require 'net/http'
require 'open-uri'
require 'json'
 
 class GetPrograms

  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"

  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def program_school
      programs = JSON.parse(self.get_programs)
      programs.collect do |program|
        program["agency"]  
      end
    end

    def program_type
      programs = JSON.parse(self.get_programs)
      programs.collect do |program|
        program["program_type"]  
      end
    end

    def site_name
      programs = JSON.parse(self.get_programs)
      programs.collect do |program|
        program["site_name"]  
      end
    end

end

#  programs = GetPrograms.new.get_programs
#  puts programs

# programs = GetPrograms.new
# puts programs.program_school.uniq

# programs = GetPrograms.new
# puts programs.program_type.uniq

programs = GetPrograms.new
puts programs.site_name.uniq