module Fareharbor
  class Error < StandardError
  end
  class BadRequest < Error
  end
  class ClientError < Error
  end
  class EnhanceYourCalm < Error
  end
  class Forbidden < Error
  end
  class NotAllowed < Error
  end
  class NotFound < Error
  end
  class ServerError < Error
  end
  class TooManyRequests < Error
  end
  class Unauthorized < Error
  end
end
