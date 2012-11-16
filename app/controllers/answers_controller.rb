class AnswersController < ApplicationController
  before_filter :assign_question

  def index
  @answers = @question.answers

  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @answers }
  end
  end



   # GET /polls/1
   # GET /polls/1.json
   def show
     @answer = Answer.find(params[:id])

     respond_to do |format|
       format.html  #{ redirect_to poll_answer_path(@question) }
       format.json { render json: @answer }
     end
   end

   # GET /polls/new
   # GET /polls/new.json
   def new
      @answer = Question.find(params[:question_id]).answers.create

     # :notice => "The encrypted url(slug) for your poll is #{@answer.slug}"

     respond_to do |format|
       format.html # new.html.erb
       format.json { render json: @answer }
     end
   end

   # GET /polls/1/edit
   def edit
     @answer = @question.answers.find(params[:id])
   end

   # POST /polls
   # POST /polls.json
   def create
     @poll = Poll.find(params[:poll_id])
     @question = Question.find(params[:question_id])
     @answer = @question.answers.build(params[:answer])

     respond_to do |format|
       if @answer.save
         format.html { redirect_to poll_questions_path(@poll)}
         format.json { render json: @answer, status: :created, location: @answer }
       else
         format.html { render action: "new" }
         format.json { render json: @answer.errors, status: :unprocessable_entity }
       end
     end
   end

   # PUT /polls/1
   # PUT /polls/1.json
   def update
     @answer = @question.answers.find(params[:id])

     respond_to do |format|
       if @answer.update_attributes(params[:answer])
         format.html { redirect_to answers_path(@question)  }
         format.json { head :no_content }
       else
         format.html { render action: "edit" }
         format.json { render json: @answer.errors, status: :unprocessable_entity }
       end
     end
   end

   # DELETE /polls/1
   # DELETE /polls/1.json
   def destroy
     @answer = @question.answers.find(params[:id])
     @answer.destroy

     respond_to do |format|
       format.html { redirect_to answers_path(@question) }
       format.json { head :no_content }
     end
   end

   private
     def assign_question
        @question = Question.find(params[:question_id])
     end
end
