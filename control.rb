#!/usr/bin/env ruby

require 'rubygems'
require 'daemons'

pwd = __dir__
Daemons.run_proc('erb-maker', {:dir_mode => :normal, :dir => '/opt/pids/sinatra'}) do
  Dir.chdir(pwd)
  exec "rackup -p 3746 --host 127.0.0.1"
end