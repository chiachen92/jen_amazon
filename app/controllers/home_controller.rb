class HomeController < ApplicationController
  def index

  end

  def about
  end

  def contact
  end

  def contact_submit
    @name = params[:full_name]
    # instance variable @name so we can pass it in views file contact_submit.html.erb with these parameters :full_name from the form in contact.html.erb
  end


end
