class Post < ActiveRecord::Base

  belongs_to :category
  default_scope  { order(:created_at => :desc) }
  validates :title, presence: true

end

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  body        :text
#  created_at  :datetime
#  updated_at  :datetime
#  category_id :integer
#
