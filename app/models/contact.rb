class Contact < ActiveRecord::Base
  belongs_to :book
  
  serialize :phone_numbers, Array
  serialize :email_addresses, Array

end
