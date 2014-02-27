class SubscriptionsController < ApplicationController
  def index
  end

  def create
    puts "KKKKKKKK"
    puts "KKKKKKKK"
    puts params
    @subscription = Subscription.new(params[:subscription])
    @subscription.user = current_user
    @subscription.plan_id = "premium"
    if @subscription.save_with_payment
    redirect_to @subscription, :notice => "Thank you for &crarr subscribing!"
    else
      render :new
    end
  end

  def new

    @subscription = Subscription.new
    @subscription.plan_id = "premium"
    @subscription.user = current_user
  end

  def destroy
  end

  def show
  end
end
