module EventsHelper


    def attende_event?
        event = Event.find_by(id: params['id'])
        return !event.invitations.where(attendee: current_user).exists?
    end

    def event_not_expired?
        event = Event.find_by(id: params['id'])
        is_expired = (event.date <= DateTime.now)? true : false
        return !is_expired
    end
end
