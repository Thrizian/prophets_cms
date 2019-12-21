class SubjectsController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in
  # To prevent having to define a subject many times throughout this controller
  # use a private method to find the subject for us.
  before_action :find_subject, only: [:show, :edit, :update, :delete, :destroy]

  def index
    @subjects = Subject.sorted
  end

  def show
  end

  def new
    @subject_count = Subject.count + 1
    @subject = Subject.new
  end

  def create
    # Instantiate a new object using form params
    @subject = Subject.new(subject_params)

    # Save the object
    if @subject.save
      # If save succeeds redirect to index action
      flash[:notice] = 'Subject created successfully.'
      redirect_to subjects_path
    else
      @subject_count = Subject.count + 1
      render :new
    end

  end

  def edit
    @subject_count = Subject.count
  end

  def update
    # Update the object
    if @subject.update_attributes(subject_params)
      # If update succeeds redirect to show action
      flash[:notice] = 'Subject updated successfully.'
      redirect_to subject_path(@subject)
    else
      @subject_count = Subject.count
      # render edit if errors
      render :edit
    end
  end

  def delete
  end

  def destroy
    @subject.destroy

    flash[:notice] = "Subject '#{@subject.name}' destroyed successfully"
    redirect_to subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

  def find_subject
    @subject ||= Subject.find(params[:id])
  end


end
