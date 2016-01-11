class ListenerRequest < ActiveRecord::Base
  belongs_to :hotel
  validates :first_name, presence: {message: 'Введите имя'}
  validates :last_name, presence: {message: 'Введите фамилию'}
  validates_uniqueness_of :email
  validates :email, presence: {message: 'Введите email'}
  validates :phone, presence: {message: 'Введите телефон'}
end
