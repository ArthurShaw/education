# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Section.create(:title => 'Общая программа', :title_en => 'Main program', :is_main => true)

u = User.create(email: 'admin@admin.ru', password: 'password', first_name: 'Admin', last_name: 'Admin')
u.add_role("admin")
u.add_role("publisher")

PageContent.create(name: 'Контакты', content: '<h1>Contacts page</h1>', id: 5)
PageContent.create(name: 'Орг. коммитет', content: '<h1>Contacts page</h1>', id: 3)
PageContent.create(name: 'Main page', content: '<h1>Main page</h1>', id: 1)
PageContent.create(name: 'Contacts', content: '<h1>Contacts page</h1>', id: 2)

Section.create(title: '')
Section.create(title: '')
Section.create(title: '')
Section.create(title: '')
Section.create(title: '')