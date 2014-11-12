require 'rails_helper'

describe Post do

  # Prefix class methods with a '.'
  describe '.category_name' do
    context "with no category" do
      it "returns nil" do
        # setup
        post = Post.new

        # exercise
        category_name = post.category_name

        # verify
        expect(category_name).to be(nil)

        # teardown is handled for you by RSpec
      end
    end

    context "with category" do
      it "returns category's name" do
        # setup
        category = Category.new(name: 'Test cat')
        post = Post.new(category: category)

        # exercise and verify
        expect(post.category_name).to eq(category.name)

        # teardown is handled for you by RSpec
      end
    end
  end

  describe '.category_name=(name)' do
    it 'can create a new Category' do
      # setup
      post = Post.new

      # exercise
      category_name = 'A new category name!'
      post.category_name = category_name

      # verify
      expect(post.category.name).to eq('category_name')

    end
  end

  # Prefix instance methods with a '#'
  describe '#all' do
    it 'orders reverse chronologically' do
      # setup
      post1 = Post.create(title: 'post 1')
      post2 = Post.create(title: 'post 2')

      # excercise and verify
      expect(Post.all).to eq([post2, post1])
    end
  end

end
