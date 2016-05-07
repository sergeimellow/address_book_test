class Book < ActiveRecord::Base
  belongs_to :user
  has_many :contacts
  has_many :emails

  validates_presence_of :title
end
