class User < ApplicationRecord
  before_create :generate_token
  has_many :saved_streets

  has_secure_password
  

  validates :email, presence: true, uniqueness: true
  validates :password, 
            presence: true,
            :length => {:minimum => 6},
            :on => :create

  def saved_street(street_id)
    saved_streets.find_by_street_id(street_id)
  end

  def get_saved_streets(client)
    saved_street_array = []
    saved_streets.each do |saved_street|
      saved_street_array << client.get("wisd-cxpy", {:crossstreetmainid => "#{saved_street.street_id}"})
    end
    saved_street_array
  end


  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(:auth_token => self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    self.save!
  end
end
