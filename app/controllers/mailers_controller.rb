class MailersController < ApplicationController
  def create
    MoodSenderJob.perform_async(params[:mailers][:email], params[:mailers][:mood])
    # MoodSenderJob.perform_at(<timestamp>, params[:mailers][:email], params[:mailers][:mood])   >> can tell it to do a thing at some other time
    flash[:message] = "You did it! Email sent to #{params[:mailers][:email]}"
    redirect_to "/sent"
  end

  def sent
  end
end
