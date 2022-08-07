class UserSerializer
  def self.new(user)
    {
      "data": {
        "type": "users",
        "id": 1,
        "attributes": {
          "email": user.email,
          "api_key": user.api_key
        }
      }
    }
  end
end
