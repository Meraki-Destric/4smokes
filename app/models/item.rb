class Item < ApplicationRecord
  has_one_attached :thumbnail
  belongs_to :user
  has_many :libraries
  #   Allows many books and many users to associate with one another through libraries
  has_many :added_books, through: :libraries, source: :user
end
