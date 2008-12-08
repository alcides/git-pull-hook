require 'rubygems'
require 'sinatra'
require 'json'
require 'yaml'

config =  YAML::load_file('repos.yml')

post '/' do
  push = JSON.parse(params[:payload])
  remote_repo = push['repository']['name']
  local_repo = config['repo_home'] + config['repos'][remote_repo]
  `cd #{local_repo} && git pull origin master`
  "ok"
end

get '/:remote' do
  remote_repo = params[:remote]
  local_repo = config['repo_home'] + config['repos'][remote_repo]
  `cd #{local_repo} && git pull origin master`
end