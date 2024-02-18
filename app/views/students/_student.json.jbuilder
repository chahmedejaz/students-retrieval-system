json.student do
  json.extract! student, :id, :name, :email

  json.course do
    json.extract! student.course, :id, :course_name, :credit_hours
  end
end
