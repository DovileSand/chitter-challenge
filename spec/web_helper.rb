def sign_up(firstname: 'MakersLady', username: 'MissWonderful', email: 'MakersLady@paradise.com', password: 'M3dali0n5', password_confirmation: 'M3dali0n5')
  visit ('/new')
    fill_in :firstname, with: firstname
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button('Sign Up')
end
