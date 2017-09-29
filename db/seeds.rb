rab1 = Rabbi.create(first_name: "Arthur", last_name: "Markson", branch_of_judaism: "reform",    temple: "Temple rodef mammon", charisma_level: 3, city: "nowherevile, AK")


rab2 = Rabbi.create(first_name: "Roger", last_name: "Desnenberg", branch_of_judaism: "reform", temple: "Temple sholom",dob: "1985-08-02", charisma_level: 4, city: "los angeles, CA")

rab3 = Rabbi.create(first_name: "Jackson", last_name: "Jakes" , branch_of_judaism: "reform", dob: "1988-03-08",  temple: "Temple sholom", charisma_level: 5, city: "los angeles, CA")

rab2 = Rabbi.create(first_name: "Olivia", last_name: "Oliver"   , branch_of_judaism: "reform", temple: "Temple sholom", dob: "1990-04-06", charisma_level: 1, city: "los angeles, CA")

user1 = User.create(name: "tyler albertson", email: "tyeler@example.com",        password: "password")

admin = User.create(name: "admin", email: "admin@admin.com", password: "admin", role: 1)

user4 = User.create(name: "Rachel Toads", email: "rachel@example.com",    password: "password")

user2 = User.create(name: "joe Toads", email: "joe@example.com",        password: "password")

ser1 = Service.create(name: "Marrige Cermony", fee: 675)

ser2 = Service.create(name: "Counseling session", fee: 955)

ser3 = Service.create(name: "Business Advice", fee: 877)

ser4 = Service.create(name: "Divorce", fee: 545)

ser5 = Service.create(name: "Funeral", fee: 444)

ser6 = Service.create(name: "Coffee at Starbucks", fee: 250)







Appointment.create(rabbi_id: rab2.id, user_id: user2.id, service_id: ser1.id, time_and_date: "2018-09-03 04:30")

Appointment.create(rabbi_id: rab2.id, user_id: user1.id, service_id: ser2.id, time_and_date: "2018-05-01 07:15")


Appointment.create(rabbi_id: rab1.id, user_id: user1.id, service_id: ser2.id, time_and_date: "2018-07-02 02:45")

Appointment.create(rabbi_id: rab2.id, user_id: user2.id, service_id: ser2.id, time_and_date: "2018-05-01 07:15")


Appointment.create(rabbi_id: rab1.id, user_id: user2.id, service_id: ser2.id, time_and_date: "2018-07-02 02:45")
