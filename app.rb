require("bundler/setup")
require('pry')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/addicts/new') do
  erb(:addicts_form)
end

get('/addicts') do
  @addicts = Addict.all()
  erb(:addicts)
end
