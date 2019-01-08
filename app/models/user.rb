class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :company

  has_many :bins, through: :company
  has_many :collects, through: :bins
  has_many :bin_types, through: :bins

  has_one :user_behaviour_diag, dependent: :destroy
  has_one :user_behaviour_result, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  attr_accessor :created_by_referent

  validates :civility, :first_name, :last_name, :role, :email, :telephone, :password, presence: true

  validates :telephone, format: {
    with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/,
    message: I18n.t('errors.phone_format')
  }

  def send_on_create_confirmation_instructions
    if self.created_by_referent
      false
    else
      send_confirmation_instructions
    end
  end

  def reset_password(new_password, new_password_confirmation)
    if new_password.present?
      self.password = new_password
      self.password_confirmation = new_password_confirmation
      self.confirmed_at = Time.current
      save
    else
      errors.add(:password, :blank)
      false
    end
  end

  def ekg_checked?
    self.newsletter_ekg
  end

  def dzd_checked?
    self.newsletter_dzd
  end

  def name
    "#{first_name} #{last_name}"
  end

  def admin?
    self.admin
  end

  def referent?
    self.company.referent.user == self
  end
end
