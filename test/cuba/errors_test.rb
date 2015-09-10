require 'helper'

scope Cuba::Errors do
  setup do
    @app = Cuba
  end

  scope '#forbidden!' do
    test 'sets status and headers' do
      get '/forbidden'
      assert_status 403
      assert_equal '', last_response.body
    end

    test 'renders a template when settings[:errors][:forbidden] is set' do
      Cuba.settings[:render][:views] = 'test/views'
      Cuba.settings[:errors][:forbidden] = 'forbidden'
      get '/forbidden'
      assert_status 403
      assert_header 'Content-Type', 'text/html; charset=utf-8'
      assert_equal 'Forbidden!', last_response.body
    end
  end

  scope '#not_found!' do
    test 'sets status and headers' do
      get '/not_found'
      assert_status 404
      assert_equal '', last_response.body
    end

    test 'renders a template when settings[:errors][:not_found] is set' do
      Cuba.settings[:render][:views] = 'test/views'
      Cuba.settings[:errors][:not_found] = 'not_found'
      get '/not_found'
      assert_status 404
      assert_header 'Content-Type', 'text/html; charset=utf-8'
      assert_equal 'Not Found!', last_response.body
    end
  end

  scope '#internal_server_error!' do
    test 'sets status and headers' do
      get '/internal_server_error'
      assert_status 500
      assert_equal '', last_response.body
    end

    test 'renders a template when settings[:errors][:internal_server_error] is set' do
      Cuba.settings[:render][:views] = 'test/views'
      Cuba.settings[:errors][:internal_server_error] = 'internal_server_error'
      get '/internal_server_error'
      assert_status 500
      assert_header 'Content-Type', 'text/html; charset=utf-8'
      assert_equal 'Internal Server Error!', last_response.body
    end
  end
end
