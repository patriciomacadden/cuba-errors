require 'helper'

scope Cuba::NotFound do
  setup do
    @app = Cuba
  end

  scope '#not_found!' do
    test 'sets status and headers' do
      get '/'
      assert_status 404
      assert_equal '', last_response.body
    end

    test 'renders a template when settings[:not_found][:view] is set' do
      Cuba.settings[:render][:views] = 'test/views'
      Cuba.settings[:not_found][:view] = 'not_found'
      get '/'
      assert_status 404
      assert_header 'Content-Type', 'text/html; charset=utf-8'
      assert_equal 'Not Found!', last_response.body
    end
  end
end
