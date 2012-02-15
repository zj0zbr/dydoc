require "sinatra"
require "rdiscount"

set :markdown, :layout_engine => :erb, :layout => :layout

get '/' do
	markdown :flow
end	

get '/:md' do 
	markdown File.read(File.dirname(__FILE__) + "/views/#{params[:md]}.md")
end