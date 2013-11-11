class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find_by(:id => params[:id])
  end

  def new
    courses = Course.all
    @course_options = [[]]
    courses.each do |course|
      @course_options << [course.title, course.id]
    end
  end

  def create
    @meeting = Meeting.new
    @meeting.held_on = params[:held_on]
    @meeting.course_id = params[:course_id]

    if @meeting.save
      redirect_to meetings_url
    else
      render 'new'
    end
  end

  def edit
    @meeting = Meeting.find_by(:id => params[:id])
  end

  def update
    @meeting = Meeting.find_by(:id => params[:id])
    @meeting.held_on = params[:held_on]
    @meeting.course_id = params[:course_id]

    if @meeting.save
      redirect_to meetings_url
    else
      render 'new'
    end
  end

  def destroy
    @meeting = Meeting.find_by(:id => params[:id])
    @meeting.destroy
    redirect_to meetings_url
  end
end
