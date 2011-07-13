class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end
   
  # ----------------
  #
  # Save the form data to a session var so that it can
  # be recalled and used later.
  #
  # Redirect to the next page for the form.
  #
  # ----------------
  def create         
    session[:company] = params[:company]
    redirect_to new_company_contact_path
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      redirect_to @company, :notice  => "Successfully updated company."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_url, :notice => "Successfully destroyed company."
  end         
end
