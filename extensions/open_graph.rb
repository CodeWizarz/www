# frozen_string_literal: true

require 'middleman'
require_relative '../helpers/open_graph_helper'

class OpenGraph < Middleman::Extension
  include OpenGraphHelper
  expose_to_template :open_graph_image_tags
end

::Middleman::Extensions.register(:open_graph, OpenGraph)
