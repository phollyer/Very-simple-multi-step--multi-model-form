require File.dirname(__FILE__) + '/../spec_helper'

describe CompanyContactsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => CompanyContact.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    CompanyContact.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    CompanyContact.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(company_contact_url(assigns[:company_contact]))
  end

  it "edit action should render edit template" do
    get :edit, :id => CompanyContact.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    CompanyContact.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CompanyContact.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    CompanyContact.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CompanyContact.first
    response.should redirect_to(company_contact_url(assigns[:company_contact]))
  end

  it "destroy action should destroy model and redirect to index action" do
    company_contact = CompanyContact.first
    delete :destroy, :id => company_contact
    response.should redirect_to(company_contacts_url)
    CompanyContact.exists?(company_contact.id).should be_false
  end
end
