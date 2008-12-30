require 'rubygems'
require 'sinatra'
require 'json'
require 'yaml'

config =  YAML::load_file('repos.yml')


def get_local_path remote
  config['repo_home'] + config['repos'][remote]
end

post '/' do
  push = JSON.parse(params[:payload])
  remote_repo = push['repository']['name']
  local_repo = get_local_path remote_repo
  `cd #{local_repo} && git pull origin master`
  "ok"
end

# GET /remote-repo used for debugging

get '/:remote' do
  remote_repo = push['repository']['name']
  local_repo = get_local_path remote_repo
  `cd #{local_repo} && git pull origin master`
end