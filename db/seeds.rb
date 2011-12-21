# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#note in rails3.1 you have to rake assets:precompile

#change it as needed
s_dir = File.expand_path("../../public/assets/seed_data", __FILE__)
#get names of the files from the source dir
albums = Dir.entries(s_dir)

Album.delete_all

albums.each do |a|
  next if a=='.'
  next if a=='..'

  #we are interested in dirs
  if File.directory?(s_dir+"/"+a)
    #Create a new entry in the albums table
    album=Album.new(:title=>a.gsub("_",""), :directory=>a)
    album.save
  end
end

#Add the images to albums
albums=Album.find(:all)

Photo.delete_all

albums.each do |a|
  next unless File.directory?(s_dir+"/"+a.directory)

  current_dir=Dir.pwd

  #move into images
  Dir.chdir(s_dir+"/"+a.directory)
  images=Dir.entries('.')

  Dir.chdir(current_dir)

  images.each do |i|
    next if File.directory?(i)
    next if i !~/.(jpg|png|gif)$/i
    if File.exists?(s_dir+"/"+a.directory+'/'+i)
      p=Photo.new(:title=>i, :description=>i+":needs description", :path=>"/assets/seed_data/"+a.directory+"/"+i, :album_id=>a.id, :name=>i)
      p.save
    end
  end
end