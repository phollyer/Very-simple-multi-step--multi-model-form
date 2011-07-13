Then /^there should be (\d+) company contacts* in the database$/ do |num|
  CompanyContact.all.size.should eq(num.to_i)
end