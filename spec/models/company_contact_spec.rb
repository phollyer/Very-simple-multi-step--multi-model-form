require File.dirname(__FILE__) + '/../spec_helper'

describe CompanyContact do
  it "should be valid" do
    CompanyContact.new.should be_valid
  end
end
