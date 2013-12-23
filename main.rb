require 'sinatra'
require 'haml'
require_relative 'lib/core_ext/hash'

get '/' do
  @source = File.read("source.txt")
  @tree = @source.split(/[[:space:]]/).reject(&:empty?).each_cons(2).group_by { |first, last| first.downcase }
  @title = @tree.random_sentence(3).gsub(/[[:punct:]]/, "")
  @text = @tree.random_text
  haml :index
end

get '/favicon.ico' do
end
