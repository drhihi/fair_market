class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :send_welcome_mail

  validates_presence_of :name

  enum role: %i[customer admin], _prefix: true

  private

  def send_welcome_mail
    UserMailer.with(user: self).welcome_mail.deliver_now
  end
end
