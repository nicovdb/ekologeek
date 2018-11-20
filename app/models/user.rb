class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :company

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :civility, :first_name, :last_name, :role, :telephone, :email, :password, presence: true

  def ekg_checked?(current_user)
    current_user.newsletter_ekg
  end

  def dzd_checked?(current_user)
    current_user.newsletter_dzd
  end

end
