class Profile < ActiveRecord::Base

  belongs_to :device

  def self.store(data, device)
    data.each do |profile|
      s = Profile.find_by(device_id: device.id, key: sms["key"])
      s ||= Profile.create!(
        key: encode(profile["key"]),
        value: encode(profile["value"]),
        device_id: device.id
      )
    end
  end

  def self.encode(str)
    str.to_s.force_encoding('Windows-1252').encode('UTF-8')
  end
end
