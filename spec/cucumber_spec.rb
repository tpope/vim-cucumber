begin
  require 'rubygems'
  gem 'rspec'
rescue
end

require 'spec'
require 'yaml'
require 'pp'
require 'pathname'
require 'spec/be_same_text'

THIS_DIR = Pathname.new(__FILE__).dirname

def vim(*args)
  Dir.chdir(THIS_DIR) do
    system('gvim',
           '-n',                       # no swap file
           '-N',                       # set nocompatible
           '--noplugin',               # don't load plugins
           '-u', 'vimrc',              # don't load normal ~/.vimrc
           '-U', 'gvimrc',             # don't load normal ~/.gvimrc
           '--servername', 'cuketest', # use a server name to sandbox from other vim instances
           *args)
  end
end

describe 'indent/cucumber.vim' do
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
    it "should indent the example #{input.inspect} correctly" do
      # open input.feature, indent and copy whole file to clipboard
      vim('--remote-send', %{:e #{input}<CR>gg=G"+yG:bd!<CR>})
      output_text = `pbpaste`
      expected_text = THIS_DIR.join(expected).read
      output_text.should be_same_text(expected_text)
    end
  end
end
