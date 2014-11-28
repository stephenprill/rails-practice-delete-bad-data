  namespace :assignments do
  desc "list all"
  task :list => :environment do
    Assignment.all.each do |assignment|
      p assignment
    end

  desc "find orphans"
  task :find => :enviroment do
    missing_a_person = Assignment.where.not(person_id: Person.pluck(:id))
    missing_a_location = Assignment.where.not(location_id: Location.pluck(:id))
    puts "There are #{missing_a_person} records without a person"
    puts "There are #{missing_a_location} records without a person"
  end

  namespace :orphans do
    desc "delete orphans"
  task :delete => :enviroment do
    missing_a_person = Assignment.where.not(person_id: Person.pluck(:id)).delete_all
    missing_a_location = Assignment.where.not(location_id: Location.pluck(:id)).delete_all
  end

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
    #rake siggments:orphans:delete
    #rake assignments:prhapns:find

end
end
