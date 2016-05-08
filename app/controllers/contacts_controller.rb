class ContactsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_book, only: [:new, :create, :show, :edit, :update, :destroy]


  def index
    redirect_to @book
  end

  def new
    @contact = @book.contacts.build
  end

  def create
    updated_params = contact_params
    updated_params['phone_numbers']=updated_params['phone_numbers'].split(',')
    updated_params['email_addresses']=updated_params['email_addresses'].split(',')
    @contact = Contact.new(updated_params)
    @contact.book = @book
    if @contact.save
      redirect_to @book
    else
      render action: 'new'
    end
  end

  def show
    
  end

  def edit
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
  def destroy
    @contact.destroy
    redirect_to @book
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end
  
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :description, :phone_numbers, :email_addresses, :book_id)
    end
end
