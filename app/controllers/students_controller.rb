class StudentsController < ApplicationController
  before_action :set_student, only: %i[ edit update destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
    begin
      set_student
    rescue ActiveRecord::RecordNotFound => _e
      respond_to do |format|
        format.html { redirect_to students_url, alert: "Student with ID #{params[:id]} not found." }
        format.json { render json: { error: "Student with ID #{params[:id]} not found." } }
      end
    end
  end

  # GET /students/new
  def new
    @student = Student.new
    @course = Course.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @course = Course.new(course_params)
    @student = Student.new(student_params)
    @course.student = @student

    respond_to do |format|
      begin
        # saving courses and students in a transaction so that if any of them gets fails the entire transaction should rollback
        ActiveRecord::Base.transaction do
          @student.save
          @course.save
          raise StandardError if (@student.errors.any? or @course.errors.any?)
        end

        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }

      rescue StandardError => _e
        set_errors
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      begin
        # saving courses and students in a transaction so that if any of them gets fails the entire transaction should rollback
        ActiveRecord::Base.transaction do
          @student.update(student_params)
          @course.update(course_params)
          raise StandardError if (@student.errors.any? or @course.errors.any?)
        end

        format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }

      rescue StandardError => _e
        set_errors
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # POST /students/search or /students/search.json
  def search
    # it gets the student id in the params
    begin
      set_student
      respond_to do |format|
        format.html { redirect_to student_url(@student) }
        format.json { render json: @student }
      end
    rescue ActiveRecord::RecordNotFound => _e
      respond_to do |format|
        format.html { redirect_to students_url, alert: "Student with ID #{params[:id]} not found." }
        format.json { render json: { error: "Student with ID #{params[:id]} not found." } }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
      @course = @student.course
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :email)
    end

    def course_params
      params.require(:student).permit(:course_name, :credit_hours)
    end

    # combining the student and course errors to be displayed on the UI
    def set_errors
      @errors = @student.errors.to_a.concat(@course.errors.to_a)
    end
end
