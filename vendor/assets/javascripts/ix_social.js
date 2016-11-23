'use strict'


const facebook = 'facebook'
const intagram = 'instagram'

const routes = {
  facebook: '/social/facebook',
  instagram: '/social/instagram'
}


$(() => {
  $('.js-social').each(function(){
    ix_social_get($(this))
  })
})

function ix_social_get($social) {
  let namespace = $social.data('social')
  $.ajax({
    url: routes[namespace],
    success: (html) => $social.replaceWith(html),
    errror: () => $social.html('Oups!')
  })
}
