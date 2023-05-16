class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # On a utilisé un callback qui permet juste après l'inscription en base d'un nouvel utilisateur, d'appeler la méthode d'instance welcome_send
  # Celle-ci ne fait qu'appeler le mailer UserMailer en lui faisant exécuter welcome_email avec, pour seule entrée, l'instance créée (d'où le self).
  after_create :welcome_send

  has_many :attendances
  has_many :events, through: :attendances
  has_many :admins, class_name: 'Event', foreign_key: 'admin_id'

  validates :description, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def users?
    attendances.count > 0
  end

  def admin?
    events.count > 0
  end
end
