require 'rails_helper'

describe Users::UpdateName do

  it 'should update first name of an archived user' do
    user = User.create(first_name: 'Jane', archived: true)

    Users::UpdateName.new.call

    expect(user.reload.first_name).to eq 'John'
  end

end
