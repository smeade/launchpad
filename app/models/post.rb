class Post < ActiveRecord::Base

  searchkick highlight: [:text]

  paginates_per 5

  belongs_to :category
  has_many :comments

  validates :title, presence: true

  # eager load associations on indexing
  scope :search_import, -> { includes(:comments) }

  def search_data
    {
      text: title_with_comments_body
    }
  end

  def title_with_comments_body
    comments_body = comments.map(&:body).join("|")
    "#{self.title} | #{comments_body}"
  end

  # given a name, create a new Category on the fly
  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
    self.save
  end

  def category_name
    self.category.try(:name)
  end

  # Format details from searchkick
  def self.search_highlighted_details(posts)
    highlighted_details = []
    posts.with_details.each do |post, details|
      highlighted_details << details[:highlight][:text]
    end
    highlighted_details
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
