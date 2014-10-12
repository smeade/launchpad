class Post < ActiveRecord::Base

  belongs_to :category
  has_many :comments

  default_scope  { order(:created_at => :desc) }
  validates :title, presence: true

  def category_name
    self.category.try(:name)
  end

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
    self.save
  end

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
