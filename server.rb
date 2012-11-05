require 'sinatra'
require_relative 'validator'
require_relative 'word_finder'


def get_word_tempalte(letters)
  validator = Validator.new
  letters = validator.clean params[:letters]
  word_finder = WordFinder.new
  word_finder.find letters
end

class Server < Sinatra::Base
  set :public_folder, File.dirname(__FILE__) + '/static'

  get '/' do
    if params[:letters]
      begin
        @words = get_word_tempalte params[:letters]
      rescue ValidationError
        return erb :error, :layout => (request.xhr? ? false : :layout)
      end
    else
      @words = []
    end
    erb :words, :layout => (request.xhr? ? false : :layout)
  end
end
