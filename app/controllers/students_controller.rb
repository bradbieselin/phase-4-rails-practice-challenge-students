class StudentsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :not_valid
    def index
        students = Student.all 
        render json: students, include: :instructor, status: 200
    end

    def show
        student = Student.find(params[:id])
        render json: student, include: :instructor, status: 200
    end

    def create
        student = Student.create!(student_params)
        render json: student, status: :created
    end

    def update
        student = Student.find(params[:id])
        student.update!(student_params)
        render json: student, status: :ok
    end

    def destroy
        student = Student.find(params[:id])
        student.destroy
        head = :no_content
    end

    private

    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end

    def not_found
        render json: { error: 'Not Found' }, status: :not_found
    end

    def not_valid
        render json: { error: 'Not Valid' }, status: :not_valid
    end
end
