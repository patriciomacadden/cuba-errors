require 'bundler/setup'

require 'cuba'
require 'cuba/render'
require 'oktobertest'
require 'oktobertest/contrib'
require 'rack/test'

require 'cuba/not_found'

Cuba.plugin Cuba::Render
Cuba.plugin Cuba::NotFound

Cuba.define do
  on default do
    not_found!
  end
end
