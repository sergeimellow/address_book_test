class Book < ActiveRecord::Base
  belongs_to :user
  has_many :contacts

  validates_presence_of :title

  def to_csv(options = {})
    CSV.generate(options) do |csv|
      values = ["id", "First Name" ,"Last Email","Description","Email Addresses", "Phone Numbers"]
      csv << values
      self.contacts.each do |contact|
      	id = contact.id
        first_name = contact.first_name
        last_name = contact.last_name 
        description = contact.description 
        email_addresses = contact.email_addresses.to_s.gsub(/["\[\]]/, "") 
        phone_numbers = contact.phone_numbers.to_s.gsub(/["\[\]]/, "")
        data = [id, first_name, last_name, description, email_addresses, phone_numbers]
        csv << data
      end
      csv
    end
  end


  def import(file)
    CSV.foreach(file.path, headers:true) do row
      contact = Book.contacts.find_by_id(row["id"]) || new
      Contact.create! row.to_hash
    end
  end

end
