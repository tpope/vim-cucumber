begin
  require 'rubygems'
  gem 'rspec', '>=2.1.0'
  gem 'escape', '>=0.0.4'
rescue
end

THIS_DIR = Pathname.new(__FILE__).dirname

require 'yaml'
require 'pp'
require 'pathname'
require 'escape'
require THIS_DIR.join('be_same_text')

def vim_cmd(*args)
  [
    'gvim',
    '-n',                       # no swap file
    '-N',                       # set nocompatible
    '--noplugin',               # don't load plugins
    '-u', 'vimrc',              # don't load normal ~/.vimrc
    '-U', 'gvimrc',             # don't load normal ~/.gvimrc
    '--servername', 'cuketest', # use a server name to sandbox from other vim instances
    *args
  ]
end

def vim_eval(*args)
  cmd = Escape.shell_command(vim_cmd(*args))
  `#{cmd}`.to_s.chomp
end

def vim(*args)
  Dir.chdir(THIS_DIR) do
    system(*vim_cmd(*args))
  end
end

describe 'GetCucumberIndent in indent/cucumber.vim' do
  before(:all) do
    # start vim server
    vim
    sleep 1
  end

  after(:all) do
    # stop vim server
    sleep 1
    vim('--remote-send', ':qall!<CR>')
  end

  examples = %w[example-basic example-comments example-table]
  examples.each do |base|
    input = "#{base}.feature"
    expected = "#{base}.expected.feature"
    it "indents the example #{input.inspect} correctly" do
      # open input.feature, indent and copy whole file to clipboard
      vim('--remote-send', %{:e #{input}<CR>gg=G"+yG:bd!<CR>})
      output_text = `pbpaste`
      expected_text = THIS_DIR.join(expected).read
      output_text.should be_same_text(expected_text)
    end
  end

  it "indents blank lines correctly" do
    input = 'example-blanks.feature'
    vim('--remote-send', %{:e #{input}<CR>jjo})
    begin
      col = vim_eval('--remote-expr', %{col('.')})
      col.should == '3'
    ensure
      vim('--remote-send', %{<Esc>})
    end
  end
end
