class Comment < ActiveRecord::Base

  has_paper_trail
  searchkick

  belongs_to :category, touch: true
  belongs_to :post, touch: true
  belongs_to :user, touch: true

  geocoded_by :ip_address
  after_validation :set_region_name

  default_scope  { order(:created_at => :asc) }

  # given a name, create a new Category on the fly
  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
    self.save
  end

  def category_name
    self.category.try(:name)
  end

  def set_region_name
    if self.ip_address && self.region_name.blank?
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
