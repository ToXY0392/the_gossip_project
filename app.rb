# app.rb

require 'bundler'
Bundler.require

require_relative 'lib/router'

router = Router.new
router.perform
