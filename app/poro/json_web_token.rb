require 'jwt'

class JsonWebToken
  # Encodes and signs the payload
  def self.encode(payload)
    payload.reverse_merge!(meta)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  # Decode the JWT to get the user email
  def self.decode(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)
  end

  # Validates the payload hash for expiration and meta claims
  def self.valid_payload(payload)
    if expired(payload) || payload['iss'] != meta[:iss]
      return false
    else
      return true
    end
  end

  # Default options to be encoded in the token
  def self.meta
    {
      exp: 7.days.from_now.to_i,
      iss: 'Street Art Walk'
    }
  end

  # Validates if the token is expired by exp parameter
  def self.expired(payload)
    Time.at(payload['exp']) < Time.now
  end
end
