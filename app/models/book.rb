class Book < ActiveRecord::Base
  belongs_to :user
  has_many :contacts

  validates_presence_of :title
end
