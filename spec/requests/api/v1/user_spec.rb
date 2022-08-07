require 'rails_helper'

RSpec.describe "user endpoints" do
  it "creates a user" do
    login = {
      'email': 'therealemail@email.com',
      'password': '12345',
      'password_confirmation': '12345'
    }

    post '/api/v1/users', params: login
    expect(response.status).to eq(201)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to have_key :data
    expect(user[:data]).to be_a Hash
    expect(user[:data]).to have_key :id
    expect(user[:data]).to have_key :attributes
  end

  it "sends an error message if email address already exists" do
    user = User.create(email: 'therealemail@email.com', password: '12345', password_confirmation: '12345')
    login = {
      'email': 'therealemail@email.com',
      'password': 'dragon',
      'password_confirmation': 'dragon'
    }

    post '/api/v1/users', params: login

    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)
    expect(error[:error]).to eq("Email has already been taken")
  end

  it "sends an error message if password does not match password confirmation" do
    login = {
      'email': 'therealemail@email.com',
      'password': 'dragon',
      'password_confirmation': 'lizard'
    }
    post '/api/v1/users', params: login

    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)
    expect(error[:error]).to eq("Password confirmation doesn't match Password")
  end

  it "sends an error message if email is blank" do
    login= {
      'email': '',
      'password': 'dragon',
      'password_confirmation': 'dragon'
    }
    post '/api/v1/users', params: login

    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)
    expect(error[:error]).to eq("Email can't be blank")
  end

  it "sends an error message if password is blank" do
    login = {
      'email': 'therealemail@email.com',
      'password': '',
      'password_confirmation': ''
    }
    post '/api/v1/users', params: login

    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)
    expect(error[:error]).to eq("Password can't be blank and Password can't be blank")

  end
end
