class Subscription < ActiveRecord::Base
  attr_accessible :user_id, :plan_id, :stripe_card_token

  belongs_to :user

  def save_with_payment
  if valid?
    customer = Stripe::Customer.create(description: self.user.email, plan: plan_id, card: stripe_card_token)
    self.stripe_customer_token = customer.id
    save!
  end
  rescue Stripe::InvalidRequestError => e
    puts e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
  end
end
