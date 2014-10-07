class Post < ActiveRecord::Base

  default_scope  { order(:created_at => :desc) }

end

# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#
