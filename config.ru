require 'sinatra'
require 'rubygems'
 
Sinatra::Application.default_options.merge!(
  :run => false,
  :env => :production
)
 
require 'git-fetch-hook.rb'
run Sinatra.application