# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "seeding users"

emails=["tester1@test.com"]

emails.each do |email|
	puts email
	u = User.new
	u.email = "#{email}"
	u.password = email.split("@").first << "123"
	u.password_confirmation = email.split("@").first << "123"
	u.save!
end

User.all.each do |user|
	book1 = Book.create(title: "Work Address Book", description: "My business and work contacts", user_id: user.id)
	book2 = Book.create(title: "Personal Address Book", description: "My friends and family", user_id: user.id)
	10.times do |n|
		if n%2 == 0 
			Contact.create(first_name: "work_first_name_#{n}", last_name: "work_last_name_#{n}", book_id: book1.id, email_addresses: ["work#{n}@work.com","work#{n+10}@work.com"], phone_numbers: ["#{n+20}33212244", "#{n+20}43214444"])
		else
			Contact.create(first_name: "personal_first_name_#{n}", last_name: "personal_last_name_#{n}", book_id: book2.id, email_addresses: ["personal#{n}@person.com", "personal#{n+10}@person.com"], phone_numbers: ["#{n+20}33212244", "#{n+20}33214444"])
		end
	end
end