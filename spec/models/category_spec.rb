require 'rails_helper'

describe Category do
  it 'does not have valid name when nil' do
    category = Category.create(name: nil)
    expect(Category.all.count).to eql(0)
  end
end
