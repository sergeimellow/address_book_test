class AddEmailAndPhoneToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :email_addresses, :text
    add_column :contacts, :phone_numbers, :text
  end
end
