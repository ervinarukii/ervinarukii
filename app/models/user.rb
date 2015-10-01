class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged
  mount_uploader :avatar, AvatarUploader
  
  # has_many :animes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :first_name, :last_name, :email, :username

  def has_payment_info?
    self.braintree_customer_id.present?
  end

  def is_admin?
    self.admin
  end

  def payment(params)
    if params[:type].eql?('subscription')
      result = Braintree::Subscription.create(
        plan_id: "silver_plan",
        price: params[:amount],
        payment_method_nonce: params[:payment_method_nonce]
      )
    else
      if self.has_payment_info?
        result = Braintree::Transaction.sale(
          customer_id: self.braintree_customer_id,
          amount: params[:amount],
          payment_method_nonce: params[:payment_method_nonce]
        )
      else
        result = Braintree::Transaction.sale(
          amount: params[:amount],
          payment_method_nonce: params[:payment_method_nonce],
          customer: {
            first_name: params[:customer][:first_name],
            last_name: params[:customer][:last_name],
            email: params[:customer][:email],
            phone: params[:customer][:phone]
          },
          options: {
            store_in_vault: true
          }
        )

        self.update(braintree_customer_id: result.transaction.customer_details.id)

      end
    end

    return result
  end
end
