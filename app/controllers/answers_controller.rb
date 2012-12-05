class AnswersController < ApplicationController
  before_filter :assign_question

  def index
    @answers = @question.answers
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Question.find(params[:question_id]).answers.create
  end

  def edit
    @answer = @question.answers.find(params[:id])
  end

  def create
    @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(params[:answer])

     respond_to do |format|
       if @answer.save
         format.html { redirect_to poll_questions_path(@poll)}
       else
         format.html { render action: "new" }
       end
     end
   end

  def update
    @answer = @question.answers.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to answers_path(@question)  }
      else
        format.html { render action: "edit" }
      end
     end
  end

  def destroy
    @answer = @question.answers.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_path(@question) }
     end
   end

  private
    def assign_question
      @question = Question.find(params[:question_id])
    end
end
