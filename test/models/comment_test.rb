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

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
