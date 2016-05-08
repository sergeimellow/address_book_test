class ContactsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_contact, only: [:show, :edit, :update, :destroy]


  def index
    book = Book.find(params[:book_id])
    redirect_to book
  end

  def new
    #1st you retrieve the post thanks to params[:post_id]
    book = Book.find(params[:book_id])
    #2nd you build a new one
    @contact = book.contacts.build

  end

  def create
    updated_params = contact_params
    updated_params['phone_numbers']=updated_params['phone_numbers'].split(',')
    updated_params['email_addresses']=updated_params['email_addresses'].split(',')
    @contact = Contact.new(updated_params)
    if @contact.save
      redirect_to @contact
    else
      redirect_to root_path
    end
  end

  def show
    
  end

  def update
    updated_params = contact_params
    updated_params['phone_numbers']=updated_params['phone_numbers'].split(',')
    updated_params['email_addresses']=updated_params['email_addresses'].split(',')
    if @contact.update(updated_params)
      redirect_to @contact.book, notice: 'Updated contact'
    else
      render action: 'edit'
    end
  end


  private
    def set_contact
      @contact = Contact.find(params[:id])
    end
  
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :description, :phone_numbers, :email_addresses, :book_id)
    end
end
