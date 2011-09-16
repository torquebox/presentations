module BeerCatalogue

  module Authentication

    def authenticated?
      !session[:user].nil?
    end

    def authenticate( username, password )
      return false if username.nil? || password.nil?
      # TODO: Add auth
      user = User.first(:name=>username)
      user = User.create(:name=>username) if user.nil?
      session[:user] = username
    end

    def current_user
      User.first(:name=>session[:user])
    end

    def logout
      session[:user] = nil
    end

    def skip_authentication
      request.env['SKIP_AUTH'] = true
    end

    def require_authentication
      return if request.env['SKIP_AUTH']
      return if authenticated?
      redirect '/login'
    end
  end
end


