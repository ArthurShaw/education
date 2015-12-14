# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
MailContent.create(name: 'Рассылка расписания (Всем)', id: 8)
MailContent.create(name: 'Новый комментарий к докладу (Докладчику)', id: 7)
MailContent.create(name: 'Доклад отклонен (Докладчику)', id: 6)
MailContent.create(name: 'Доклад одобрен (Докладчику)', id: 5)
MailContent.create(name: 'Новый доклад (Администратору)', id: 4)
MailContent.create(name: 'Докладчик зарегистрировался (Администратору)', id: 3)
MailContent.create(name: 'Докладчик зарегистрировался (Докладчику)', id: 2)
MailContent.create(name: 'Слушатель зарегистрировался (Слушателю)', id: 1)
PageContent.create(name: 'Регламент', content: '<h1> Регламент конференции</h1>', id: 9)
PageContent.create(name: 'Культурная программа', content: '<h1> Cultural Program</h1>', id: 7)
PageContent.create(name: 'Варианты размещения', content: '<h1> Accommodation </h1>', id: 8)
PageContent.create(name: 'Информационное письмо', content: '<h1>ABOUT CONFERENCE</h1>', id: 6)
PageContent.create(id: 4, name:'Address', content: '', content_type: 1)
Section.create(:title => 'Общая программа', :title_en => 'Main program', :is_main => true)

u = User.create(email: 'admin@admin.ru', password: 'password', first_name: 'Admin', last_name: 'Admin')
u.add_role("admin")
u.add_role("publisher")

PageContent.create(name: 'Контакты', content: '<h1>Contacts page</h1>', id: 5)
PageContent.create(name: 'Орг. коммитет', content: '<h1>Contacts page</h1>', id: 3)
PageContent.create(name: 'Main page', content: '<h1>Main page</h1>', id: 1)
PageContent.create(name: 'Contacts', content: '<h1>Contacts page</h1>', id: 2)

