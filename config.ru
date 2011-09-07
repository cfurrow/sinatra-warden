require "rubygems"
require "bundler"

Bundler.require
require 'sinatra'
require 'warden'
require 'haml'

pwd = File.dirname(__FILE__)
$:.unshift "#{pwd}/lib"
require 'warden_strategies'
require 'login_app'
require 'blog_app'
require 'user'


##
use Rack::Session::Cookie
use Warden::Manager do |manager|
  manager.default_strategies :password
  manager.failure_app = LoginManager
end

map "/blog" do
  run Blog
end

map "/" do
  run LoginManager  
end
