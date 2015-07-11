post '/create_answer/:id' do
	answer = params[:answer]
	id = params[:id]
	Answer.create(answers: answer, respond_id: session[:id], question_id: id)
	redirect to("/#{id}")
end