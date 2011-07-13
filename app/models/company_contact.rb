class CompanyContact < ActiveRecord::Base
  attr_accessible :contact_name
  
  belongs_to :company
end
