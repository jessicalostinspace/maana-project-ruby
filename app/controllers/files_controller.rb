require 'find'
# require 'zip'

class FilesController < ApplicationController
  def index
  	count_array = []

  	path_name = params[:path_name]

  	dir = File.dirname(path_name.to_s)

  	if File.exist?(path_name.to_s)
  		Find.find(path_name.to_s) do |path|
  			if path =~ /\.zip$/
  				extract_zip(path, path.chomp('.zip'))
  			end 

  			#If path is txt file, open, count words, and put wc into array
  			if path =~ /\.txt$/
  				file = File.open(path, "r")

  				count = 0

  				file.each_line do |line|
  					count += line.force_encoding("ISO-8859-1").encode("utf-8", replace: nil).split.size
  				end	

  				count_array.push(count)
  			end
  		end
  		count_array = count_array.sort
  		puts count_array
  		
  	end	

  	# render json: count_array

  end


end
