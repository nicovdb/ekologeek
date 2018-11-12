class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :referent


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :civility, :first_name, :last_name, :role, :telephone, :email, :password, presence: true
end
