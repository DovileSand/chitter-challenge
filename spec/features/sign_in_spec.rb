feature 'User sign in:' do

  let(:user) do
    User.create(email: 'MakersLady@paradise.com',
                password: 'M3dali0n5',
                password_confirmation: 'M3dali0n5')
  end

  scenario 'I can sign in with correct email address, username and password' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Hello #{user.email}, chitter is happy to see you!"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in 'email', with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
