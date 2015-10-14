class Cuba
  module Errors
    def self.setup(app)
      app.settings[:errors] ||= {}
      if app.settings.include? :render
        app.settings[:errors][:layout] ||= app.settings[:render][:layout]
      end
    end

    def forbidden!
      error! 403, :forbidden
    end

    def not_found!
      error! 404, :not_found
    end

    def internal_server_error!
      error! 500, :internal_server_error
    end

    private

    def error!(status, view)
      res.status = status
      if settings[:errors].include? view
        res.headers['Content-Type'] = 'text/html; charset=utf-8'
        render settings[:errors][view], {}, settings[:errors][:layout]
      end
    end
  end
end
