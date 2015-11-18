feature 'User sign in:' do

  let(:user) do
    user = User.create(email: 'MakersLady@paradise.com',
                password: 'M3dali0n5',
                password_confirmation: 'M3dali0n5')
  end

  scenario 'I can sign in with correct email address, username and password' do
    sign_in(user.email, user.password)
    expect(page).to have_content "Hello #{user.email}, chitter is happy to see you!"
  end

  scenario 'My account is not authenticated when I give an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end

  def sign_in(email, password)
    visit '/new_session'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
