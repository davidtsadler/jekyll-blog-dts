namespace :jekyll do
  desc 'Delete generated _site files'
  task :clean do
    system "rm -rf public"
  end

  desc 'Run the dev server'
  task :server do
    system "jekyll --server --auto"
  end
end
