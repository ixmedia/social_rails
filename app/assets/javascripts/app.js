window.SocialRails = () => {

  const routes = {
    facebook: '/social/facebook',
    instagram: '/social/instagram',
    twitter: '/social/twitter'
  }

  const placeholders = document.getElementsByClassName('js-social')

  for( let i = 0, len = placeholders.length; i < len; i++ ) {
    const placeholder = placeholders[i]
    const namespace = placeholder.dataset.namespace
    const node      = document.getElementById(`social-${namespace}`)
    const options   = JSON.parse(node.dataset.options)
    node.dataset.options = []
    update_social_content(placeholder, { namespace, node, options })
  }

  function update_social_content (placeholder, {namespace, node, options}) {
    const xhr = new XMLHttpRequest()
    xhr.open('GET', routes[namespace])

    xhr.onload = () => {
      if (xhr.status === 200) {
        node.innerHTML = xhr.responseText
      }

      if (options.refresh === true) {
        setTimeout(() => update_social_content(placeholder, { namespace, node, options }), options.refresh_time)
      }
    }
    xhr.send()
  }
}

/* Auto init */
window.SocialRails();
