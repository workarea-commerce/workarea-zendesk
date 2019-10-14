require 'workarea/zendesk'

module Workarea
  module Zendesk
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::Zendesk
    end
  end
end
