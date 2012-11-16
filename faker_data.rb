require 'faker'

create table students (primary_key integer NOT NULL AUTO_INCREMENT, first_name varchar, last_name varchar, email varchar, phone 
                       integer, created_at datetime, updated_at datetime, )



1000.times do
  s = Student.new(
    first_name     = Faker::Name.first_name
    last_name      = Faker::Name.last_name    
    email          = Faker::Email.email
    phone          = Faker::Phone.phone
    created_at     = Time.now
    updated_at     = Time.now
    )
    
    s.save
end

