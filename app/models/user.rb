class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Essentially, if the user is destroyed, all associated data will be deleted as well
  has_many :posts, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :libraries
  has_many :library_additions, through: :libraries, source: :book
end
