class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    @contact_new = Contact.new
  end

  # def new
  #   @contact_new = Contact.new
  # end

  def create
    @contact_new = Contact.new(contact_params_new)
    @contact_new.save()
    redirect_to contacts_path
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
    redirect_to contacts_path
  end

  def find_by_mandant
    mandant = @view.ask('mandant')
    result = Contact.joins(:commentaires).where(commentaires: {mandant: mandant})
    @view.display(result)
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    # no need for app/views/contacts/destroy.html.erb
    redirect_to contact_path
  end

  private

  def contact_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:contact).permit(:entite, :cp)
  end


  def contact_params_new
    params.require(:contact).permit(:entite, :cp)
  end
end
