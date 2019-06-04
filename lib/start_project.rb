#!/Users/student/.rvm/rubies/ruby-2.6.0/bin/ruby

class Project

  GEMS = ['rspec', 'rubocop', 'simplecov', 'simplecov-console']

  def initialize(project_name = ARGV[0])
    @project_name = project_name
  end

  def mkdir
    raise "#{@project_name} already exists." unless system("mkdir #{@project_name}")
  end

  def work_in_directory
    Dir.chdir("#{@project_name}") do
      git
      readme
      gitignore
      notes      
      lib
      bundle
      gems
      rspec
      rubocop
    end
  end

  def git
    system('git init')
  end

  def readme
    system("echo '# #{@project_name.capitalize}\n'>README.md")
    system("echo '## Specifications\n'>>README.md")
    system("echo '## Design and code structure approach\n'>>README.md")
    system("echo '## Getting started\n'>>README.md")
    system("echo '## Usage\n'>>README.md")
    system("echo '## Running tests\n'>>README.md")
    system("echo '## Final thoughts\n'>>README.md")
    system("echo '## Roadmap'>>README.md")
  end

  def gitignore
    system("echo 'notes.txt' >.gitignore")
    system("echo 'coverage/' >> .gitignore")
  end

  def notes
    system('touch notes.txt')
  end

  def lib
    system("mkdir lib")
  end

  def bundle
    system('bundle init')
  end

  def gems
    GEMS.each do |gem|
      g = gem
      system("bundle add #{g}")
    end
  end

  def rspec
    system('rspec --init')
    system("echo '-f d' >> .rspec")
    system("echo 'require \"simplecov\"
require \"simplecov-console\"
SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.start' >>spec/spec_helper.rb")
    system("echo 'RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts \"\e[31mAre you running rubocop? Just run: rubocop\e[0m\"
    puts \"\e[31mAlso remember to commit when passing a new test!\e[0m\"
  end
end' >>spec/spec_helper.rb")
  end

  def rubocop
    system("echo 'AllCops:
  Exclude:
    - \"Gemfile\"
    - \"spec/spec_helper.rb\"' > .rubocop.yml ")
  end
end

pro = Project.new
pro.mkdir
pro.work_in_directory
