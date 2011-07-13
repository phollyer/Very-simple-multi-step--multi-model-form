class CompanyContactsController < ApplicationController
  def index
    @company_contacts = CompanyContact.all
  end

  def show
    @company_contact = CompanyContact.find(params[:id])
  end

  def new
    @company_contact = CompanyContact.new
  end                 

  # ----------------
  #
  # Create the new CompanyContact from the form data.
  # Create the new Company from the session data.
  #
  # Save the company first so that it has an id.
  # Set the foreign key company_id in CompanyContact to @company.id now
  # that @company has been saved.  
  # Save the CompanyContact.
  #
  # Redirect to show the company.
  #
  # ----------------
  def create
    @company_contact = CompanyContact.new(params[:company_contact])  
    @company = Company.new(session[:company])
    @company.save
    @company_contact.company_id = @company.id
    @company_contact.save
    redirect_to @company
  end

  def edit
    @company_contact = CompanyContact.find(params[:id])
  end

  def update
    @company_contact = CompanyContact.find(params[:id])
    if @company_contact.update_attributes(params[:company_contact])
      redirect_to @company_contact, :notice  => "Successfully updated company contact."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @company_contact = CompanyContact.find(params[:id])
    @company_contact.destroy
    redirect_to company_contacts_url, :notice => "Successfully destroyed company contact."
  end
end
