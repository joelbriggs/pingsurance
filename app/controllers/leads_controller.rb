class LeadsController < ApplicationController
    before_action :create_new_lead, only: %i[index]
    
    def index
        @leads = Lead.all.order(created_at: :desc)
    end

    def create
        @lead = Lead.new(lead_params)

        respond_to do |format|
            if @lead.save
                send_sms(@lead)
                format.html { redirect_to root_path, notice: "Lead, #{@lead.first_name} #{@lead.last_name}, was successfuly created!" }
            else
                format.html { redirect_to root_path, notice: "Error, please try again." }
            end
        end
    end

    private

    def lead_params
        params.require(:lead).permit(:first_name, :last_name, :phone, :notes)
    end

    def create_new_lead
        @new_lead = Lead.new
    end

    def send_sms(lead)
        client = TwilioClient.new
        client.send_text(lead)
    end

end
