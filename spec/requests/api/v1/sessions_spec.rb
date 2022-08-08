require 'rails_helper'

RSpec.describe "sessions endpoints" do
  it "logs in a user" do
    User.create(email: 'therealemail@email.com', password: "12345", password_confirmation: "12345", api_key: "98765" )
    login = {
      'email': 'therealemail@email.com',
      'password': '12345'
    }

    post '/api/v1/sessions', params: login
    expect(response.status).to eq(200)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to have_key :data
    expect(user).to be_a Hash
    expect(user[:data]).to have_key :type
    expect(user[:data]).to have_key :id
    expect(user[:data]).to have_key :attributes
    expect(user[:data][:attributes]).to have_key :email
    expect(user[:data][:attributes]).to have_key :api_key
  end

  it "has an error when email is not filled in correctly" do
    User.create(email: 'therealemail@email.com', password: "12345", password_confirmation: "12345", api_key: "98765" )
    login = {
      'email': 'thefakeemail@email.com',
      'password': '12345'
    }
    post '/api/v1/sessions', params: login
    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:error]).to eq("Incorrect Email/Password, Please try again")

  end

  it "has an error when password is not correct" do
    User.create(email: 'therealemail@email.com', password: "12345", password_confirmation: "12345", api_key: "98765" )
    login = {
      'email': 'thefakeemail@email.com',
      'password': '12345'
    }
    post '/api/v1/sessions', params: login
    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:error]).to eq("Incorrect Email/Password, Please try again")
  end
end
