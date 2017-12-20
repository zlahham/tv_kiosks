# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "**  Seeding Database: seeding ***\n\n"

Department.create([
                    { name: 'Biochemical Engineering', colour: '#0097A9' },
                    { name: 'Chemical Engineering', colour: '#8F993E' },
                    { name: 'Civil, Environmental and Geomatic Engineering', colour: '#EA7600' },
                    { name: 'Computer Science', colour: '#8DB9CA' },
                    { name: 'Electronic and Electrical Engineering', colour: '#B5BD00' },
                    { name: 'Mechanical Engineering', colour: '#500778' },
                    { name: 'Medical Physics and Biomedical Engineering', colour: '#002855' },
                    { name: 'Science, Technology, Engineering and Public Policy', colour: '#AC145A' },
                    { name: 'Security and Crime Science', colour: '#F6BE00' },
                    { name: 'UCL School of Management', colour: '#003D4C' }
                  ])

puts "-- Created All the Engineering Departments\n"

puts "\n**  Seeding Database: completed ***"
