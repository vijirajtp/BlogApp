class HomeController < ApplicationController

  def index
  end

  def contact
    @contact= Contact.new
  end
  def send_message
    @contact = Contact.new(params[:contact])
        if @contact.save
          UserMailer.deliver_contact_notifier(@contact)
          flash[:success] = 'Your message has been sent successfully.'
          redirect_to root_url
        else
          render :action => 'contact'
        end
  end

  def ajax_examples
    
  end

  def greet
    respond_to do |format|
      format.js
    end
  end

  def get_time
    #sleep 1.second
    render :text => Time.now
  end

  def reverse   
    @reversed_text = params[:text_to_reverse].reverse
    render :layout => false
  end

end
