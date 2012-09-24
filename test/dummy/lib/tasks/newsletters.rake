namespace :newsletters do

  desc "Send newsletters to Emailvision"
  task :publish => :environment do
  	content = StandardNewsletter.daily_fr

    message = Emailvision4rails::Message.new(content, default_message_params)
    campaign = Emailvision4rails::Campaign.new(default_campaign_params)

    # Message
    unless message.create
      return false
    end

    # Campaign
    campaign.message_id = message.id
    unless campaign.create
      return false        
    end
    campaign.post
  end

  private
 
  def default_message_params
    {
      :name => 'My message',
      :subject => 'Hello',
      :from => 'Bastien Gysler', 
      :from_email => 'basgys@gmail.com',
      :reply_to => 'Bastien Gysler',
      :reply_to_email => 'basgys@gmail.com',  
      :hotmail_unsub_flg => true,
      :is_bounceback => false,
      :encoding => 'UTF-8',
      :type => 'email'
    }
  end
 
  def default_campaign_params
    {
      :name => 'My Campaign',
      :analytics => true
    }
  end  

end
