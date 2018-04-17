'use strict';

window.SocialRails = function () {

  var routes = {
    facebook: '/social/facebook',
    instagram: '/social/instagram',
    twitter: '/social/twitter'
  };

  var _iteratorNormalCompletion = true;
  var _didIteratorError = false;
  var _iteratorError = undefined;

  try {
    for (var _iterator = document.getElementsByClassName('js-social')[Symbol.iterator](), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
      var placeholder = _step.value;

      var namespace = placeholder.dataset.namespace;
      var node = document.getElementById('social-' + namespace);
      var options = JSON.parse(node.dataset.options);
      node.dataset.options = [];
      update_social_content(placeholder, { namespace: namespace, node: node, options: options });
    }
  } catch (err) {
    _didIteratorError = true;
    _iteratorError = err;
  } finally {
    try {
      if (!_iteratorNormalCompletion && _iterator.return) {
        _iterator.return();
      }
    } finally {
      if (_didIteratorError) {
        throw _iteratorError;
      }
    }
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
