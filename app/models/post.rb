class Post < ActiveRecord::Base

  belongs_to :category
  has_many :comments

  validates :title, presence: true

  # given a name, create a new Category on the fly
  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
    self.save
  end

  def category_name
    self.category.try(:name)
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
