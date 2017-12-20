class CustomerTypeRate < Spyke::Base
  has_many :custom_field_instances, uri: nil
  has_one :customer_prototype, uri: nil
  has_one :customer_type, uri: nil
end
