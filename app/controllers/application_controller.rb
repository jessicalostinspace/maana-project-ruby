
class ApplicationController < ActionController::Base
require 'zip'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def extract_zip(file, destination)
	  FileUtils.mkdir_p(destination)

	  Zip::File.open(file) do |zip_file|
	    zip_file.each do |f|
	      fpath = File.join(destination, f.name)
	      zip_file.extract(f, fpath) unless File.exist?(fpath)
	    end
	  end
	end

end
