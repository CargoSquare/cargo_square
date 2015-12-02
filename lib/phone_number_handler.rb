module PhoneNumberHandler
  def self.format_phone_number(phone_number)
    # Purify
    phone_number = self.pure_phone_number(phone_number)
    # TODO format phone number
    return phone_number
  end
  def self.pure_phone_number(phone_number)
    return phone_number.gsub(/[^0-9]/, '')
  end
end
