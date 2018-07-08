class ContactsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    @company.contacts.create(contact_params)
    redirect_to company_path(params[:company_id])
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end
end
