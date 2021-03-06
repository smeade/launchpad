class Category < ActiveRecord::Base

  has_many :posts
  has_many :comments

  default_scope { includes(:posts) }

end

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
