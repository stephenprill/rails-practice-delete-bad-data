namespace :assignments do
desc "list all"
task :list => :environment do
  Assignment.all.each do |assignment|
    p assignment
  end

  desc "find orphans"
  task :prohans => :enviroment do
    Assignment.where.not(person_id: Person.pluck(:id))

    # p in front of assignments if you use tail -f log/development.log
    # rake  assignment:orphans
    # you enver have to pass an idea ot any active record finder ever
    #Assingment.where.not(person_id: [1,2,3,4])
    # Person.pluck(:id)  returns an array of all the ids of people (in this table)
    #Assignment.pluck(:person_id) -> Assignments have more person ids that there are in peopl
    #existing_person_ids = Person.pluck(:id)
    #Assignment.where(person_id: existing_person_ids) have a table and split it in half where good and ids match and the other half of the table where people have been deleted
    #Then do a Assignmnet.where.not(person_id:existing_person_ids) to get what is not
    #p Assignment.where.not(person_id: Person.all)

end
end
