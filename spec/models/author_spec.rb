require 'rails_helper'

RSpec.describe Author, type: :model do
  it { should have_many(:posts) }
  it { should have_many(:likes) }
  it { should have_many(:comments) }

  subject do
    Author.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
               posts_counter: 0)
  end

  it 'check if name validation is working with name' do
    expect(subject).to be_valid
  end

  it 'check if name validation is working without' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'check if posts counter validation is working' do
    expect(subject.posts_counter).to be_a_kind_of(Numeric)
  end
end
