require "sinatra"
require "rdiscount"
require "json"

set :markdown, :layout_engine => :erb, :layout => :layout

get '/' do
	markdown :flow
end	

get '/doc/:md' do 
  path = File.read(File.dirname(__FILE__) + "/views/#{params[:md]}.md")
  pass if File.exist?(path)
  
	markdown path
end


get '/doc.json' do
  path = File.dirname(__FILE__) + "/views"
  
  list = Array.new
  
  Dir.glob("#{path}/*.md") { |entry| 
      File.open("./#{entry}") do |f| 
        lines = f.readlines
        
        title =  lines[0].sub(/##/, '')
        url = File.basename(entry, '.md')
        
        list << {:title => title, :url => "/doc/#{url}" } 
      end
  }

  content_type :json
  
  list.to_json
end