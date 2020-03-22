module EventsHelper


    def attende_event?
        event = Event.find_by(id: params['id'])
        return !event.invitations.where(attendee: current_user).exists?
    end
end
