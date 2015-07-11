get '/create_question' do
	erb :new_question
end

get '/id' do
	erb :answers
end

get '/:id' do
	question_id = params[:id]
	@question = Question.find(question_id)
	@answers = @question.answers
	erb :answers
end