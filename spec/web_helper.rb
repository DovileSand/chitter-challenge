def sign_up
  visit ('/')
  expect(page.status_code).to eq(200)
    fill_in :firstname, with: 'MakersLady'
    fill_in :username, with: 'MissWonderful'
    fill_in :email, with: 'MakersLady@paradise.com'
    fill_in :password, with: 'M3dali0n5'
    fill_in :password_confirmation, with: 'M3dali0n5'
    click_button "Sign up"
end
