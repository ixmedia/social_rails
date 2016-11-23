'use strict'

const facebook = 'facebook'
const intagram = 'instagram'

const routes = {
  facebook: '/social/facebook',
  instagram: '/social/instagram'
}

export default () => {
  $('.js-social').each(function(){
    get($(this))
  })
}

function get($social) {
  let namespace = $social.data('social')
  $.ajax({
    url: routes[namespace],
    success: (html) => $social.replaceWith(html),
    errror: () => $social.html('Oups!')
  })
}
