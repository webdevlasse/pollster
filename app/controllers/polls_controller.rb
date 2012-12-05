class PollsController < ApplicationController

  def index
    @polls = Poll.all
  end

  def show_by_slug
     @poll = Poll.find_by_slug(params[:slug])
  end

  def show
    @poll = Poll.find(params[:id])
  end

  def new
    @poll = Poll.new
    # :notice => "The encrypted url(slug) for your poll is #{@poll.slug}"
    3.times {@poll.questions.build}
  end

  def edit
    @poll = Poll.find(params[:id])
  end

  def create
    @poll = Poll.new(params[:poll])

    respond_to do |format|
      if @poll.save

        # link = "<a href=/localhost:3000/#{@poll.slug}>link</a>".html_safe

        format.html { redirect_to @poll, notice: "Poll was successfully created. Slug url => localhost:3000/#{@poll.slug}" }
      else
        format.html { render action: "new" }}
      end
    end
  end


  def update
    @poll = Poll.find(params[:id])

    respond_to do |format|
      if @poll.update_attributes(params[:poll])
        format.html { redirect_to root_path, notice: 'Poll was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @poll = Poll.find(params[:id])
    @poll.destroy

    respond_to do |format|
      format.html { redirect_to polls_url }
    end
  end
end
