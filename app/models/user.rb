class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :workshops
  validates :first_name, :last_name, presence: true
  validates_length_of :biography, :maximum => 600, too_long: 'Слишком много символов'

  has_attached_file :avatar, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: 'noavatar.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  after_create :send_welcome_email, :send_new_user_email

  def readable_name
    "#{first_name} #{last_name}"
  end

  def send_welcome_email
    UserMailer.welcome_user_email(self).deliver_now
  end

  def send_new_user_email
    UserMailer.new_speaker_email(self).deliver_now
  end
end
