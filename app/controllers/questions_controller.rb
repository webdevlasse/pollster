class QuestionsController < ApplicationController

   before_filter :assign_poll

   def index
      @questions = @poll.questions

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @questions }
      end
    end



    # GET /polls/1
    # GET /polls/1.json
    def show
      @question = Question.find(params[:id])

      respond_to do |format|
        format.html  #{ redirect_to poll_question_path(@poll) }
        format.json { render json: @question }
      end
    end

    # GET /polls/new
    # GET /polls/new.json
    def new
      @question = Question.new
      3.times {@question.answers.build}
      # :notice => "The encrypted url(slug) for your poll is #{@question.slug}"

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @question }
      end
    end

    # GET /polls/1/edit
    def edit
      @question = @poll.questions.find(params[:id])
    end

    # POST /polls
    # POST /polls.json
    def create
      @question = @poll.questions.new(params[:question])

      respond_to do |format|
        if @question.save

          format.html { redirect_to poll_questions_path(@poll) }
          format.json { render json: @question, status: :created, location: @question }
        else
          format.html { render action: "new" }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /polls/1
    # PUT /polls/1.json
    def update
      @question = @poll.questions.find(params[:id])

      respond_to do |format|
        if @question.update_attributes(params[:question])
          format.html { redirect_to poll_questions_path(@poll)  }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /polls/1
    # DELETE /polls/1.json
    def destroy
      @question = @poll.questions.find(params[:id])
      @question.destroy

      respond_to do |format|
        format.html { redirect_to poll_questions_path(@poll) }
        format.json { head :no_content }
      end
    end

    private

    def assign_poll
      @poll = Poll.find(params[:poll_id])
    end
  end


