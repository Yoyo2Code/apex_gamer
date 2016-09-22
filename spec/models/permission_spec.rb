require 'rails_helper'

describe "Permission handles restricts where a user can go" do
  fixtures :users

  context "#initialize" do
    it "initializes with a user as default" do
      permission = Permission.new(nil)

      expect(permission.user).to be_a User
    end

    it "accepts current_user as user arg" do
      current_user = User.first

      permission = Permission.new(current_user)

      expect(permission.user).to eq current_user
    end
  end

  context "#allow?" do
    it "accepts a controller" do
      current_user = User.first
      permission   = Permission.new(current_user)
      permission.allow?("home", "index")

      expect(permission.controller).to eq("home")
    end

    it "accepts an action" do
      current_user = User.first
      permission = Permission.new(current_user)
      permission.allow?("home", "index")

      expect(permission.action).to eq("index")
    end
  end

  context "#registered_user_permissions" do
    it "allows registered users access to the home controller" do
      user       = User.first
      permission = Permission.new(user)
      result     = permission.allow?("home", "index")

      expect(result).to eq(true)
    end

    it "allows registered users access to the sessions controller" do
      user       = User.first
      permission = Permission.new(user)
      result     = permission.allow?("sessions", "index")

      expect(result).to eq(true)
    end

    it "allows registered users access to the platforms controller" do
      user       = User.first
      permission = Permission.new(user)
      result     = permission.allow?("platforms", "index")

      expect(result).to eq(true)
    end

    it "allows registered users access to the companies controller" do
      user       = User.first
      permission = Permission.new(user)
      result     = permission.allow?("companies", "index")

      expect(result).to eq(true)
    end

    it "allows registered users access to the games controller" do
      user       = User.first
      permission = Permission.new(user)
      result     = permission.allow?("games", "index")

      expect(result).to eq(true)
    end

    it "allows registered users access to the maps/companies controller" do
      user       = User.first
      permission = Permission.new(user)
      result     = permission.allow?("maps/companies", "index")

      expect(result).to eq(true)
    end

    it "allows registered users access to the platforms/sales controller" do
      user       = User.first
      permission = Permission.new(user)
      result     = permission.allow?("platforms/sales", "index")

      expect(result).to eq(true)
    end

    it "allows registered users to hit 'api/v1/platforms'" do
      user       = User.first
      permission = Permission.new(user)
      result     = permission.allow?("api/v1/platforms", "index")

      expect(result).to eq(true)
    end

    it "allows registered users to hit 'api/v1/games'" do
      user       = User.first
      permission = Permission.new(user)
      result     = permission.allow?("api/v1/games", "index")

      expect(result).to eq(true)
    end

    it "allows registered users to hit 'api/v1/companies'" do
      user       = User.first
      permission = Permission.new(user)
      result     = permission.allow?("api/v1/companies", "index")

      expect(result).to eq(true)
    end
  end

  context "#guest_user_permissions" do
    it "allows guest users access to the home controller" do
      permission = Permission.new(nil)
      result     = permission.allow?("home", "index")

      expect(result).to eq(true)
    end

    it "allows guest users access to the sessions controller" do
      permission = Permission.new(nil)
      result     = permission.allow?("sessions", "index")

      expect(result).to eq(true)
    end
  end

  it "allows guest users to hit 'api/v1/platforms'" do
    permission = Permission.new(nil)
    result     = permission.allow?("api/v1/platforms", "index")

    expect(result).to eq(true)
  end

  it "allows guest users to hit 'api/v1/games'" do
    permission = Permission.new(nil)
    result     = permission.allow?("api/v1/games", "index")

    expect(result).to eq(true)
  end

  it "allows guest users to hit 'api/v1/companies'" do
    permission = Permission.new(nil)
    result     = permission.allow?("api/v1/companies", "index")

    expect(result).to eq(true)
  end
end
