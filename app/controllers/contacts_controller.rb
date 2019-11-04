class ContactsController < ApplicationController

  def index
    if params[:cp].present? || params[:entite]
      sql = 'contacts.id = contacts.id '
      sql += "and contacts.cp = #{params[:cp]} " if params[:cp].present?
      sql += "and contacts.entite LIKE '#{'%'+params[:entite].to_s+'%'}' " if params[:entite].present?
      sql += "and contacts.nom LIKE '#{'%'+params[:nom].to_s+'%'}' " if params[:nom].present?
      sql += "and contacts.type_ LIKE '#{'%'+params[:type].to_s+'%'}' " if params[:type].present?
      sql += "and contacts.ville LIKE '#{'%'+params[:ville].to_s+'%'}' " if params[:ville].present?
      sql += "and contacts.nb_departement LIKE '#{ '%'+params[:dep].to_s+'%'}' " if params[:dep].present?
      sql += "and commentaires.mandant LIKE '#{ '%'+params[:mandant].to_s+'%'}' "if params[:mandant].present?
      params[:order].present? ?  order = 'contacts.'+params[:order].to_s+' DESC' : order = 'contacts.id DESC'
   
      puts sql;
      @contacts = Contact.joins(:commentaires).where(sql).order(order).limit(500)
      else
      @contacts = Contact.all.limit(500)
    end
    @contact_new = Contact.new
    @filtre = params
  end

  def find_by_mandant
    
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
