class Contact < ActiveRecord::Base
  belongs_to :book
  
  serialize :phone_numbers, Array
  serialize :email_addresses, Array

  validates_presence_of :first_name, :last_name
  validate :all_email_addresses_are_valid
  validate :all_phone_numbers_are_valid
  validate :uniqueness_of_full_name
  validate :presence_of_phone_or_email
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  PHONE_REGEX = /\A([0-9\\x(\)\/\+ \-]*)\Z/i

  private
    def all_email_addresses_are_valid
      unless self.email_addresses.nil?
        self.email_addresses.each do |email_address|
          puts email_address
          if !email_address.strip.match(EMAIL_REGEX)
            errors.add(:email_address, " '#{email_address}' is not in a valid format. ")
          end
        end
      end
    end

    def all_phone_numbers_are_valid
      unless self.phone_numbers.nil?
        self.phone_numbers.each do |phone_number|
          puts phone_number
          if !phone_number.strip.match(PHONE_REGEX)
            errors.add(:phone_number, " '#{phone_number}' is not in a valid format. ")
          end
        end
      end
    end

    def uniqueness_of_full_name
      if self.book.contacts.where(first_name: self.first_name.strip, last_name: self.last_name.strip).count > 0 
        errors.add(:full_name, " '#{first_name} #{last_name}' already exists. ")
      end
    end

    def presence_of_phone_or_email
    	if self.phone_numbers.count == 0 && self.email_addresses.count == 0
    	  errors.add(:phone_or_email, " Please Enter atleast 1 phone number or email address. ")
    	end
    end
end
