class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :company

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :civility, :first_name, :last_name, :role, :email, :password, presence: true

  validates :telephone, format: {
    with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/,
    message: I18n.t('errors.phone_format')
  }


  def ekg_checked?(current_user)
    current_user.newsletter_ekg
  end

  def dzd_checked?(current_user)
    current_user.newsletter_dzd
  end

  def name
    "#{first_name} #{last_name}"
  end

  def admin?(current_user)
    current_user.admin
  end
end
