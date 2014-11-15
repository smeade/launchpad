class Post < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^10', 'body']
          }
        }
      }
    )
  end

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'english'
      indexes :body, analyzer: 'english'
    end
  end

  paginates_per 5

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

  # Delete the previous index in Elasticsearch
  Post.__elasticsearch__.client.indices.delete index: Post.index_name rescue nil

  # Create the new index with the new mapping
  Post.__elasticsearch__.client.indices.create \
    index: Post.index_name,
    body: { settings: Post.settings.to_hash, mappings: Post.mappings.to_hash }

  # Index all article records from the DB to Elasticsearch
  Post.import
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
