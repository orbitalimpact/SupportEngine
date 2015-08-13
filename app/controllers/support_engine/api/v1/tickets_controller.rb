require 'pry'
module SupportEngine
  module Api
    module V1
      class TicketsController < ApiController
        respond_to :json

        def create
          ticket = Ticket.new(params[:ticket])
          ticket.state = TicketStates.open
          if ticket.save
            render json: ticket, status: :created,
                   location: api_v1_ticket_url(ticket)
          else
            render json: ticket.errors, status: :unprocessable_entity
          end
        end

      end
    end
  end
end
