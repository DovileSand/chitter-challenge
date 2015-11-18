describe User do

  # let!(:user) do
  #   user = User.new(email: 'MakersLady@paradise.com', password: 'M3dali0n5',
  #   password_confirmation: 'M3dali0n5')
  #   user.save
  # end

  it 'authenticates when given a valid email address and password' do
    user = User.new(email: 'MakersLady@paradise.com', password: 'M3dali0n5',
    password_confirmation: 'M3dali0n5')
    user.save
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

end
