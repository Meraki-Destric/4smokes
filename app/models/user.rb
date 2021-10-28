class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Essentially, if the user is destroyed, all associated data will be deleted as well
  has_many :posts, dependent: :destroy
  has_many :hames, dependent: :destroy
end
