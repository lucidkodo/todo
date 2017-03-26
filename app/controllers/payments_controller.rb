class PaymentsController < ApplicationController

	def new
		@client_token = Braintree::ClientToken.generate
	end

	def checkout
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

	  result = Braintree::Transaction.sale(
	   :amount => 7.92,
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )

		  if result.success?
		  	byebug
		  	@user = User.find(session[:user_id])
		  	@user.premium = true
		  	@user.save
		  	flash[:success] = "Payment successful! You are awesome! :)"
		    redirect_to root_path 
		  else
		  	flash[:danger] = "Transaction failed. I swear I don't have your money."
		    redirect_to root_path 
		  end 
	end


end
