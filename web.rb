#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'erb'
require 'json'

helpers do
  # include ActionView::Helpers::JavaScriptHelper
  class RefHelpers
    def initialize(script_path, style_path)
      @script_path = script_path
      @script_path << '/' unless @script_path.end_with?('/')
      @style_path = style_path
      @style_path << '/' unless @style_path.end_with?('/')
    end

    class RefSubHelper
      def initialize(base_path, before, after, extras = {})
        @base_path = base_path
        @before    = before
        @after     = after
        @extras    = extras
      end

      def method_missing(method, *args, &block)
        if @extras.has_key?(method.to_sym) && args.count == 1
          "#{@before}#{@base_path}#{@extras[method.to_sym]}#{args[0]}#{@after}"
        else
          super
        end
      end
    end

    def script(path = nil)
      if path
        "<script src=\"#{@script_path}#{path}\"></script>"
      else
        @script_sub ||= RefSubHelper.new(@script_path, '<script src="', '"></script>', jquery: 'jquery/', jq: 'jquery/', ace: 'ace/')
      end
    end

    def style(path = nil)
      if path
        "<link rel=\"stylesheet\" href=\"#{@style_path}#{path}\" />"
      else
        @style_sub ||= RefSubHelper.new(@style_path, '<link rel="stylesheet" href="', '" />', jquery: 'jquery/', jq: 'jquery/', ace: 'ace/')
      end
    end
  end

  def ref
    @ref ||= RefHelpers.new('/scripts/', '/styles/')
  end
end

post '/build' do
  data = params[:text]
  renderer = ERB.new(data)
  result = renderer.result(nil)
  content_type :json
  { text: result }.to_json
end

get '/:filename' do
  @filename = :filename
  erb :editor
end