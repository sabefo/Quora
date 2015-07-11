get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

post '/sign_in' do
	session[:name] = params[:user][:name]
	# username = params[:username]
	# password = params[:password]

	if !User.find_by(username: params[:user][:username])
		# user = User.create(name: session[:name], username: username, password: password)
		user = User.create(params[:user])
		session[:id] = user.id
		redirect to('/profile')
	else
		session[:errors] = "Ese usuario ya existe"
		redirect to('/')
	end
end

get '/log_in' do

	erb :log_in
end

post '/log_in' do
	user = User.authenticate(params[:user][:username], params[:user][:password])

	if user
		# session[:name] = user.name
		session[:id] = user.id
		redirect to('/profile')
	else
		session[:errors] = "Usuario y/o contraseña equivocados"
		redirect to('/log_in')
	end
end










