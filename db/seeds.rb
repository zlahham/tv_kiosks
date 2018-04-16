# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "**  Seeding Database: seeding ***\n\n"

Department.create([
                    { name: 'Biochemical Engineering', colour: '#0097A9', code: 'biochem' },
                    { name: 'Chemical Engineering', colour: '#8F993E', code: 'chemeng' },
                    { name: 'Civil, Environmental and Geomatic Engineering', colour: '#EA7600', code: 'civil' },
                    { name: 'Computer Science', colour: '#8DB9CA', code: 'compsci' },
                    { name: 'Electronic and Electrical Engineering', colour: '#B5BD00', code: 'eleceng' },
                    { name: 'Mechanical Engineering', colour: '#500778', code: 'mecheng' },
                    { name: 'Medical Physics and Biomedical Engineering', colour: '#002855', code: 'medphys' },
                    { name: 'Science, Technology, Engineering and Public Policy', colour: '#AC145A', code: 'stepp' },
                    { name: 'Security and Crime Science', colour: '#F6BE00', code: 'crimesci' },
                    { name: 'UCL School of Management', colour: '#003D4C', code: 'management' }
                  ])

# Default admin user
User.create(email: "kiosk.admin@cs.ucl.ac.uk", name: "Seed Admin", role: 1, department_id: 1, password: "default_password")

puts "-- Created All the Engineering Departments\n"

puts "\n**  Seeding Database: completed ***"
