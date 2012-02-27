require "sinatra"
require "rdiscount"
require "json"

set :markdown, :layout_engine => :erb, :layout => :layout

ignoreSet = ['./views/about.md']

get '/' do
	markdown :deploybiandan3 
end	

get '/about' do
    markdown :about
end

get '/editor' do
    erb :editor, :layout => :editor_layout
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
      
      if !ignoreSet.include?(entry) 
      
          File.open("./#{entry}") do |f| 
            lines = f.readlines
        
            title =  lines[0].sub(/##/, '')
            fileName = File.basename(entry, '.md')
        
            list << {:fileName => fileName, :title => title, :url => "/doc/#{fileName}" } 
          end
      end
  }

  content_type :json
  
  list.to_json
end
