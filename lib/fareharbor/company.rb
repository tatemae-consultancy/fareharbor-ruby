module Fareharbor
  class Company < Spyke::Base
    uri 'companies/'

    def agents
      Fareharbor::Agent.where(shortname: self.shortname)
    end

    def availability(availability_id:)
      Fareharbor::Availability.where(
        availability_id: availability_id,
        shortname: self.shortname
      ).first
    end

    def availability_logdings(availability_id:)
      Fareharbor::AvailabilityLodging.where(
        availability_id: availability_id,
        shortname: self.shortname
      )
    end

    def desks
      Fareharbor::Desk.where(shortname: self.shortname)
    end

    def items
      Fareharbor::Item.where(shortname: self.shortname)
    end

    def lodgings
      Fareharbor::Lodging.where(shortname: self.shortname)
    end
  end
end
