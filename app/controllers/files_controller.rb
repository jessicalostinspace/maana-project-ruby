class FilesController < ApplicationController
  def index
  	path_name = params[:path_name]

  	puts path_name

  	dir = File.dirname(path_name.to_s)

  	puts dir

  	puts File.exist?(path_name.to_s)

  end
end
