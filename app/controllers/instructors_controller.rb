class InstructorsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :not_valid

    def index
        instructors = Instructor.all 
        render json: instructors, status: 200
    end

    def show
        instructor = Instructor.find(params[:id])
        render json: instructor, status: 200
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    def update
        instructor = Instructor.find(params[:id])
        instructor.update!(instructor_params)
        render json: instructor, status: :ok
    end

    def destroy
        instructor = Instructor.find(params[:id])
        instructor.destroy
        head = :no_content
    end

    private

    def instructor_params
        params.permit(:name)
    end

    def not_found
        render json: { error: 'Not Found' }, status: :not_found
    end

    def not_valid
        render json: { error: 'Not Valid' }, status: :not_valid
    end
end
