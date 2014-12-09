class Cuba
  module NotFound
    def self.setup(app)
      app.settings[:not_found] ||= {}
    end

    def not_found!
      res.status = 404
      unless settings[:not_found][:view].nil?
        res.headers['Content-Type'] = 'text/html; charset=utf-8'
        render settings[:not_found][:view]
      end
    end
  end
end
