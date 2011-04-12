require 'yaml'

namespace :jekyll do
  desc 'Delete generated _site files'
  task :clean do
    system 'rm -rf public'
  end

  desc 'Run the dev server'
  task :dev_server => [:clean] do
    system 'jekyll --server --auto'
  end

  desc 'Create a new post using the template'
  task :post => [:load_config] do
    title = ENV['TITLE']
    if title.nil?
      print "\n>> What's the title? "
      title = STDIN.gets.strip
    end 

    save_post(Time.now, title)
  end

  desc 'Creates several dummy posts for testing'
  task :dummy_posts => [:load_config, :clean_dummy_posts] do
    system "mkdir -p #{@config['source']}/_posts/dummy_posts"
    lorem_ipsum = load_lorem_ipsum()
    year = Time.now.year
    (1..20).each do |day|
      save_post(Time.new(year, 1, day), "Dummy post #{day}", lorem_ipsum, true)
    end
  end

  desc 'Removes any created dummy posts'
  task :clean_dummy_posts => [:load_config] do
    system "rm -rf #{@config['source']}/_posts/dummy_posts"
  end

  desc 'Loads the Jekyll config file into an instance variable to be used by other tasks'
  task :load_config do
    @config = YAML::load_file('_config.yml')
  end

  def save_post(date, title, content = '', dummy_post = false)
    template = File.read("#{@config['source']}/_posts/template")
    template.gsub!(/:title/, title)
    template.gsub!(/:content/, content)

    filename = "#{@config['source']}/_posts"
    filename << '/dummy_posts' if dummy_post
    filename << "/#{date.strftime('%Y-%m-%d')}-#{parameterize(title)}.markdown"
    File.open(filename, 'w') {|f| f.write(template)}
  end
  
  def parameterize(string, sep = '-')
    string.downcase.gsub(/[^a-z0-9\-_]+/, sep)
  end

  def load_lorem_ipsum
    File.read("#{@config['source']}/_posts/lorem_ipsum")
  end
end
