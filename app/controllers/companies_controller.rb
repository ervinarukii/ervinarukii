class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @companies = Company.all
    respond_with(@companies)
  end

  def show
    respond_with(@company)
  end

  def new
    @company = Company.new
    respond_with(@company)
  end

  def edit
  end

  def create
    @company = current_user.companies.new(company_params)
    @company.save
    respond_with(@company)
  end

  def update
    @company.update(company_params)
    respond_with(@company)
  end

  def destroy
    @company.destroy
    respond_with(@company)
  end

  def enter_company
  end

  def assign_company
    @company = Company.find_by_host(company_params[:host])
    if @company.present?
      unless current_tenant.eql?(@company.host) || @company.user != current_user
        Apartment::Tenant.switch!(@company.host)
        redirect_to root_url(subdomain: @company.host)
      else
        redirect_to(request.protocol + request.domain + (request.port.nil? ? '' : ":#{request.port}"), notice: "You are not authorized to access this page")
      end
    else
      flash.now[:alert] = "Your company doesn't exist"
      render :enter_company
    end
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :description, :logo, :email, :address, :telephone, :host)
    end
end
