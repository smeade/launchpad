class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  geocoded_by :ip_address
  after_validation :set_region_name

  default_scope  { order(:created_at => :asc) }

  def set_region_name
    if self.ip_address
      self.region_name = Geocoder.search(self.ip_address).first.data["region_name"]
    end
  end
end

# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  post_id     :integer
#  user_id     :integer
#  body        :text
#  created_at  :datetime
#  updated_at  :datetime
#  latitude    :float
#  longitude   :float
#  ip_address  :string(255)
#  region_name :string(255)
#
