# external gem deps
%w[
    net/ssh
    action_view
    active_support/all
    slop
    date
    yaml
  ].each { |m| require m }
include ActionView::Helpers::DateHelper
I18n.enforce_available_locales = false
# load the app
%w[
    version
    core
  ].each { |m| require "rbFlex/#{m}" }

# grab config settings for ssh
CONF = YAML::load(File.open(ENV["HOME"] + "/.rbFlex.yml")).symbolize_keys

Opts = Slop.parse do
  banner "ruby ruflex.rb [options]"
  on :y, :yesterday,  'Shows downloaded yesterday'
  on :t, :today,      'Shows downloaded today'
  on :d, :delete,     'Delete flexget log file'
  on :h, :help,       'Print help message'
end

options = Opts.to_hash
puts Opts.help and exit if options[:help] == true

flex = Rbflex.new(CONF[:server], CONF[:user])

# clean out options hash
options.each { |k, v|  options.delete(k) if v.nil? }

# launch commands
flex.printAll                                   if options.size         == 0
flex.printToday                                 if options[:today]      == true
flex.printYesterday                             if options[:yesterday]  == true
flex.deleteFlexlog(CONF[:server], CONF[:user])  if options[:delete]     == true
