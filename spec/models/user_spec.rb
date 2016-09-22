require 'rails_helper'

describe "User attributes" do
  context ".from_omniauth" do
    xit "saves or finds a user instance" do
      auth_hash = {"provider"=>"github",
                   "uid"=>"123456",
                   "info"=>
                    { "nickname"=>"Yoyo",
                      "email"=>nil,
                      "name"=>nil,
                      "image"=>"https://avatars.githubusercontent.com/u/345830?v=3",
                      "urls"=>{"GitHub"=>"https://github.com/Yoyo2Code", "Blog"=>nil} },
                      "credentials"=>
                       { "token"=>"hipposarefun", "expires"=>false},
                         "extra"=>
                           { "raw_info"=>
                            { "login"=>"Yoyo2Code",
                               "id"=>16968035}
                           }
                  }

      user = User.from_omniauth(auth_data)

      expect(user.uid).to eq(auth_data["nickname"])
      expect(user.username).to eq(auth_data["credentials"]["token"])
      expect(user.auth_token).to eq(auth_data["raw_info"]["login"])
    end
  end

  context ".logged_in?" do
    it "returns true if username exists" do
      user = User.new(
              username: "Hippos",
              auth_token: "token",
              uid: "12345"
      )

      expect(user.logged_in?).to eq true
    end

    it "returns false if username does not exist" do
      user = User.new(
              username: nil,
              auth_token: "token",
              uid: "12345"
      )

      expect(user.logged_in?).to eq false
    end
  end
end
