require "octopress-assign-tag/version"
require "octopress-tag-helpers"
require "jekyll"

module Octopress
  module Tags
    module Assign
      class Tag < Liquid::Tag
        SYNTAX = /([[:word:]]+)\s*(=|\+=|\|\|=)\s*(.*)\s*/o

        def initialize(tag_name, markup, tokens)
          @markup = markup
          super
        end

        def render(context)

          return unless markup = TagHelpers::Conditional.parse(@markup, context)

          if markup =~ SYNTAX
            var      = $1
            operator = $2
            value    = $3

            value = TagHelpers::Var.get_value(value, context)
            return if value.nil?

            context = TagHelpers::Var.set_var(var, operator, value, context)
          else
            raise SyntaxError.new("Syntax Error in 'assign tag': #{@markup} - Valid syntax: assign [var] = [source] | filter")
          end
          ''
        end
      end
    end
  end
end

Liquid::Template.register_tag('assign', Octopress::Tags::Assign::Tag)

if defined? Octopress::Docs
  Octopress::Docs.add({
    name:        "Octopress Assign Tag",
    gem:         "octopress-assign-tag",
    version:     Octopress::Tags::Assign::VERSION,
    description: "An improved assign liquid tag, featuring conditionals, concatenation, ternary asignment, and more.",
    path:        File.expand_path(File.join(File.dirname(__FILE__), "../")),
    source_url:  "https://github.com/octopress/assign-tag"
  })
end
