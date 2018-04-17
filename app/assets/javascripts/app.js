window.SocialRails = () => {

  const routes = {
    facebook: '/social/facebook',
    instagram: '/social/instagram',
    twitter: '/social/twitter'
  }

  for (const placeholder of document.getElementsByClassName('js-social')) {
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
