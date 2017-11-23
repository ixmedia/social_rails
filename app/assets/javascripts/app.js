window.SocialRails = () => {

  const routes = {
    facebook: '/social/facebook',
    instagram: '/social/instagram',
    twitter: '/social/twitter'
  }


  const placeholders = document.getElementsByClassName('js-social')

  for( let i = 0, len = placeholders.length; i < len; i++ ) {

    let namespace   = placeholders[i].dataset.namespace
    let node        = document.getElementById('social-' + namespace)
    let options     = node.dataset.options
    let xhr         = new XMLHttpRequest();

    // xhr.open('GET', `${routes[namespace]}?options=${options}`);
    xhr.open('GET', routes[namespace])

    xhr.onload = () => {
      if (xhr.status === 200)
        node.outerHTML = xhr.responseText
    }

    xhr.send()
  }

}

/* Auto init */
window.SocialRails();
