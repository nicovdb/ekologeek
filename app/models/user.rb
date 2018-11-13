class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :referent
  belongs_to :company


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company

  validates :civility, :first_name, :last_name, :role, :telephone, :email, :password, presence: true
end
