helpers do
	def set_filename(filename)
		new_filename = filename.gsub(" ","-").downcase if /\s/ =~ filename
		i = 0
		while File.exist?("public/files/#{new_filename}")
			new_filename = "#{i}-#{filename}"
			i+=1
		end
		return new_filename.gsub(" ","-").downcase
	end

	def set_scaling_filename(filename)
		"fix_#{filename}"
	end
end