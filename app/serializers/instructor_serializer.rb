class InstructorSerializer < ActiveRecord::Serializer 
    attributes :name

    has_many :students
end