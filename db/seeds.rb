# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

if Rails.env.development?
  Admin::AdminUser.destroy_all

  Admin::AdminUser.create(
    email: "admin@example.com",
    password: "password"
  )

  Person.destroy_all

  Person.create!(
    name: "Johanna",
    gender: :female,
    age: 27,
    email: "johanna@example.com",
    status: :established,
    engaged: false
  )

  Person.create!(
    name: "Jens",
    gender: :male,
    age: 29,
    email: "jens@example.com",
    status: :newcomer,
    engaged: true
  )

  Person.create!(
    name: "Fanny",
    gender: :female,
    age: 29,
    email: "fanny@example.com",
    status: :established,
    engaged: true
  )

  Person.create!(
    name: "Bruno",
    gender: :male,
    age: 29,
    email: "bruno@example.com",
    status: :newcomer,
    engaged: true
  )
end
