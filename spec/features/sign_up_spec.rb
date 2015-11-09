require 'web_helper'

feature 'User sign up:' do

  scenario 'I can sign up as a new user' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Hello MissWonderful, chitter is happy to see you!')
    expect(User.first.email).to eq('MakersLady@paradise.com')
  end

  scenario 'I am required to enter a matching password to verify account' do
    expect {sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario 'I cannot sign up without an email address' do
    expect {sign_up(email: nil)}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'I cannot sign up without a username' do
    expect {sign_up(username: nil)}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username must not be blank')
  end

  scenario 'I cannot sign up with an invalid email address' do
    expect {sign_up(email: "invalid@email")}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect{sign_up}.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end
