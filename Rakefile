desc "Parse haml layouts"
task :parse_haml do
  print "Parsing Haml layouts..."
  system(%{
    cd _layouts/haml &&
    for f in *.haml; do [ -e $f ] && haml $f ../${f%.haml}.html; done
  })
  puts "done."
end
task :parse_sass do
  print "Parsing SASS stylesheets..."
  system(%{
    cd stylesheets/sass &&
    for f in *.sass; do [ -e $f ] && sass $f ../${f%.sass}.css; done
  })
  puts "done."
end
desc "Launch preview environment"
task :preview => [:parse_haml, :parse_sass] do
  # Rake::Task["parse_haml"].invoke
  system "jekyll --auto --server"
end

desc "Build site"
task :build  => [:parse_haml, :parse_sass] do |task, args|
  # Rake::Task["parse_haml"].invoke
  system "jekyll"
end