require 'bundler/setup'

require 'cuba'
require 'cuba/render'
require 'oktobertest'
require 'oktobertest/contrib'
require 'rack/test'

require 'cuba/errors'

Cuba.plugin Cuba::Render
Cuba.plugin Cuba::Errors

Cuba.define do
  on 'forbidden' do
    forbidden!
  end

  on 'not_found' do
    not_found!
  end

  on 'internal_server_error' do
    internal_server_error!
  end
end
