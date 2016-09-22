class Permission
  attr_reader :user, :controller, :action

  def initialize(user)
    @user = user || User.new
  end

  def allow?(controller, action)
    @controller = controller
    @action     = action

    if user.logged_in?
      registered_user_permissions
    else
      guest_user_permissions
    end
  end

  private

    def registered_user_permissions
      return true if controller == "home"
      return true if controller == "games"
      return true if controller == "platforms"
      return true if controller == "companies"
      return true if controller == "games"
      return true if controller == "data"
      return true if controller == "sessions"
      return true if controller == "platforms/sales"
      return true if controller == "maps/companies"
      return true if controller == "api/v1/platforms"
      return true if controller == "api/v1/games"
      return true if controller == "api/v1/companies"
    end

    def guest_user_permissions
      return true if controller == "home"
      return true if controller == "sessions"
      return true if controller == "api/v1/platforms"
      return true if controller == "api/v1/games"
      return true if controller == "api/v1/companies"
    end
end
