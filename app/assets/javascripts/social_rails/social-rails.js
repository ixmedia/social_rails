'use strict';

window.SocialRails = function () {

  var routes = {
    facebook: '/social/facebook',
    instagram: '/social/instagram',
    twitter: '/social/twitter'
  };

  var placeholders = document.getElementsByClassName('js-social');

  for (var i = 0, len = placeholders.length; i < len; i++) {
    var placeholder = placeholders[i];
    var namespace = placeholder.dataset.namespace;
    var node = document.getElementById('social-' + namespace);
    var options = JSON.parse(node.dataset.options);
    node.dataset.options = [];
    update_social_content(placeholder, { namespace: namespace, node: node, options: options });
  }

  function update_social_content(placeholder, _ref) {
    var namespace = _ref.namespace,
        node = _ref.node,
        options = _ref.options;

    var xhr = new XMLHttpRequest();
    xhr.open('GET', routes[namespace]);

    xhr.onload = function () {
      if (xhr.status === 200) {
        node.innerHTML = xhr.responseText;
      }

      if (options.refresh === true) {
        setTimeout(function () {
          return update_social_content(placeholder, { namespace: namespace, node: node, options: options });
        }, options.refresh_time);
      }
    };
    xhr.send();
  }
};

/* Auto init */
window.SocialRails();
