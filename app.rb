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

post('/addicts') do
  name = params.fetch('name')
  @addict = Addict.new({name: name})
  @addict.save()
  @addicts = Addict.all()
  erb(:addicts)
end

get ('/addicts/:id') do
  @addict = Addict.find(params.fetch('id').to_i())
  erb(:addict_profile)
end

post('/add_relapse') do
  new_relapse = params.fetch('relapse')
  addict_relapse = Relapse.new({:relapse => new_relapse})
  id = params.fetch('addict_id')
  @addict = Addict.find(id.to_i())
  @addict.add_relapse(addict_relapse)
  redirect('/addicts/' + @addict.id().to_s())
end
