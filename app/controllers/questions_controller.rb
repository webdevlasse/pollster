class QuestionsController < ApplicationController

   before_filter :assign_poll

   def index
      @questions = @poll.questions
   end

   def show
      @question = Question.find(params[:id])
   end


    def new
      @question = Question.new
      3.times {@question.answers.build}
      # :notice => "The encrypted url(slug) for your poll is #{@question.slug}"
      #flash[:notice] => "The encrypted url(slug) for your poll is #{@answer.slug}",
    end

    def edit
      @question = @poll.questions.find(params[:id])
    end


    def create
      @question = @poll.questions.new(params[:question])

      respond_to do |format|
        if @question.save
          format.html {  redirect_to poll_questions_path(@poll) }
        else
          format.html { render action: "new" 
        end
      end
    end

    def update
      @question = @poll.questions.find(params[:id])

      respond_to do |format|
        if @question.update_attributes(params[:question])
          format.html { redirect_to poll_questions_path(@poll)  }
        else
          format.html { render action: "edit" }
        end
      end
    end

    def destroy
      @question = @poll.questions.find(params[:id])
      @question.destroy

      respond_to do |format|
        format.html { redirect_to poll_questions_path(@poll) }
      end
    end

    private

    def assign_poll
      @poll = Poll.find(params[:poll_id])
    end
  end


