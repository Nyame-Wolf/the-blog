require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should have_many(:likes) }
  it { should have_many(:comments) }
  it { should belong_to(:author) }

  it do
    should validate_presence_of(:title)
    should validate_length_of(:title).is_at_most(250)
  end
  it do
    should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0)
    should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0)
  end
end
