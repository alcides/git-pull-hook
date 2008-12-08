require 'sinatra'
require 'rubygems'
 
Sinatra::Application.default_options.merge!(
  :run => false,
  :env => :production
)
 
require 'git-pull-hook.rb'
run Sinatra.application