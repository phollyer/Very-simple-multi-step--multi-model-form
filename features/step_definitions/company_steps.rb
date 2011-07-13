Then /^there should be (\d+) compan[y|ies]+ in the database$/ do |num|
  Company.all.size.should eq(num.to_i)
end
