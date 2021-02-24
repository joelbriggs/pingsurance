class TwilioClient
  require 'twilio-ruby'
  def initialize
    @account_sid = 'SECRET'
    @api_key_sid = 'SECRET'
    @api_key_secret = 'SECRET'
  end

  def send_text(lead)
    @client = Twilio::REST::Client.new(@api_key_sid, @api_key_secret, @account_sid) 
    @client.messages.create(
        to: lead.phone,
        from: '+18045324606',
        body: lead.notes
    )
    lead.update_attributes(date_texted: Time.now)
  end

end