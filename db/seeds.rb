page_content = [
    [12, 'Архив', ''],
    [11, 'Послание Президента', ''],
    [10, 'Научный комитет', ''],
    [9, 'Регламент', ''],
    [8, 'Варианты размещения', ''],
    [7, 'Культурная программа', ''],
    [6, 'Информационное письмо', ''],
    [5, 'Контакты', ''],
    [3, 'Орг. комитет', ''],
    [2, 'Контакты', ''],
    [1, 'О форуме', '']
]

mail_content = [
    [8, 'Рассылка расписания (Всем)'],
    [7, 'Новый комментарий к докладу (Докладчику)'],
    [6, 'Доклад отклонен (Докладчику)'],
    [5, 'Доклад одобрен (Докладчику)'],
    [4, 'Новый доклад (Администратору)'],
    [3, 'Докладчик зарегистрировался (Администратору)'],
    [2, 'Докладчик зарегистрировался (Докладчику)'],
    [1, 'Слушатель зарегистрировался (Слушателю)']
]

page_content.each do |id, name, content|
  unless PageContent.exists?(id)
    PageContent.create(name: name, content: content, id: id)
  end
end

unless PageContent.exists?(4)
  PageContent.create(id: 4, name: 'Address', content: '', content_type: 1)
end

mail_content.each do |id, name|
  unless MailContent.exists?(id)
    MailContent.create(name: name, id: id)
  end
end

unless Section.exists?(:is_main => true)
  Section.create(:title => 'Общая программа', :title_en => 'Main program', :is_main => true)
end

if User.joins(:roles).where(roles: {name: Role::ADMIN_ROLES}).empty?
  u = User.create(email: 'admin@admin.ru', password: 'password', first_name: 'Admin', last_name: 'Admin')
  u.add_role('admin')
  u.add_role('publisher')
end



