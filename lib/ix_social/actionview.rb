require 'action_view'
require 'action_view/context'

::IxSocial::Helpers::Facebook.send :include, ::ActionView::Context
::IxSocial::Helpers::Instagram.send :include, ::ActionView::Context
