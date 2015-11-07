feature 'user signs up' do

  scenario 'displays welcome message after user signs up' do
    visit ('/')
      fill_in('name', with: 'MakersLady')
      fill_in('username', with: 'MissWonderful')
      fill_in('email', with: 'MakersLady@paradise.com')
      fill_in('password', with: 'M3dali0n5')

      click_on('Sign Up')
      expect(page).to have_content('Welcome MissWonderful')
  end
end
