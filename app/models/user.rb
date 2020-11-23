class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_one_attached :avatar
  validates_presence_of :firstname, :lastname
  validates :email, uniqueness: true
  has_many :addresses
  has_many :orders
  has_many :ratings, through: :orders
end
