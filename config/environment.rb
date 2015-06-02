require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require_relative '../lib/blog'
require_relative '../apps/blog/application'

Lotus::Container.configure do
  mount Blog::Application, at: '/'
end
