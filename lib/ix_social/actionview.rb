require 'action_view'
require 'action_view/context'

# so that this instance can actually "render"
::IxSocial::Helpers::Facebook.send :include, ::ActionView::Context
