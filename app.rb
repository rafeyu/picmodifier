set :slim, :format => :html5
enable :sessions

get "/" do
	slim :index
end

post '/upload' do
	if params[:file]
		@image = params[:file][:image]
		new_filename = set_filename(@image[:filename])
		FileUtils.cp(@image[:tempfile].path,"public/files/#{new_filename}")
		session[:imagename] = new_filename
		redirect "/image"
	elsif 
		redirect '/'
	end
end

get '/image' do
	redirect '/' if nil == session[:imagename]
	slim :image
end

post '/process' do
	if params[:scale] && params[:img]
		img = Magick::Image::read("public/files/#{session[:imagename]}")[0]
		case params[:scale]
		when "25smaller"
			img = img.scale(0.25)
		when "50smaller"
			img = img.scale(0.5)
		when "custom"
			w = params[:wimage].to_i
			h = params[:himage].to_i
			img = img.scale(w,h)
		else
		end
		new_filename = set_scaling_filename(session[:imagename])
		new_image = img.write("public/files/#{new_filename}")
		send_file "public/files/#{new_filename}", :filename => new_filename, :type => 'Application/octet-stream'
		img.destroy!
		session[:imagename] = nil
	else
		redirect '/'
	end
end

get '/about' do
	slim :about
end

not_found do
	slim :notfound
end

#test
get '/img' do
	img = Magick::Image::read("/home/ramdzi/Pictures/dct.png")[0]
	slim :test, :locals => {:gambar => img.columns}
end
