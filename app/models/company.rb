class Company < ActiveRecord::Base
  attr_accessible :company_name
  
  has_one :company_contact  
   
  # ----------------
  #
  # Custom method to return the contact
  # name for the company
  #
  # ----------------
  def contact_name
    self.company_contact.contact_name
  end
  
end
