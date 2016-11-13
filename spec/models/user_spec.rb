require 'rails_helper'

RSpec.describe User, type: :model do
  it 'requires a first_name' do
    user = User.new
    user.valid?
    expect(user.errors).to have_key(:first_name)
  end

  it 'requires a last_name' do
    user = User.new
    user.valid?
    expect(user.errors).to have_key(:last_name)
  end

  it 'requires an email to be unique '
    # FactoryGirl doesn't have new so have to use build

end
