# Octopress Assign Tag

A more powerful assign liquid tag. Features:

- Conditional assignment
- Ternary assignment
- Support for `||`, `||=` and `+=`

[![Build Status](https://travis-ci.org/octopress/assign-tag.svg)](https://travis-ci.org/octopress/assign-tag)
[![Gem Version](http://img.shields.io/gem/v/octopress-assign-tag.svg)](https://rubygems.org/gems/octopress-assign-tag)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://octopress.mit-license.org)

## Installation

Add this line to your application's Gemfile:

    gem 'octopress-assign-tag'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install octopress-assign-tag

Next add it to your gems list in Jekyll's `_config.yml`

    gems:
      - octopress-assign-tag

## Usage

Use the assign tag like normal.

    {% assign var1 = 'awesome' %}     //=> 'awesome'
    {% assign var2 = var1 | upcase %} //=> 'AWESOME'

Conditionally assign variables.

    {% assign linkpost = true if post.external-url %}
    {% assign comments = true unless post.comments == false %}
    {% assign url (post ? post.url : page.url) %}

Use fancy operators in assignment.

    {% assign author = post.author || page.author || site.author %}
    {% assign name ||= site.name %}
    {% assign title_text += ' →' if linkpost %}

## Contributing

1. Fork it ( https://github.com/octopress/assign-tag/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
