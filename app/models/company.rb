class Company < ActiveRecord::Base

  mount_uploader :logo, LogoUploader
  belongs_to :user
  has_many :animes, dependent: :destroy
  after_create :create_tenant

  validate :name, :host, :user

  private
    def create_tenant
      Apartment::Tenant.create(host)
    end
end
