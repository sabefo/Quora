get '/profile' do
	id = session[:id]
	@user = User.find(id)
	erb :profile
end

post '/log_out' do
	session.clear
	redirect to('/')
end

get '/questions' do
	@questions = Question.all
	erb :show_questions
end

get '/my_questions' do
	id = session[:id]
	puts "-" * 60
	puts
	puts "El id es: #{id}"
	puts
	puts "-" * 60
	user = User.find(id)
	@questions = user.questions
	erb :my_questions
end

post '/create_question' do
	new_question = params[:question]
	id = session[:id]
	Question.create(question: new_question, author_id: id)
	redirect to('/profile')
end