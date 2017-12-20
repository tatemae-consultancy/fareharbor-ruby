module Fareharbor
  class Item < Spyke::Base
    uri 'companies/:shortname/items/'

    has_many :customer_prototypes, uri: nil
    has_many :images, uri: nil
  end
end
