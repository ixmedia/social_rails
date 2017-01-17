'use strict';

window.IxSocial = function () {

  var routes = {
    facebook: '/social/facebook',
    instagram: '/social/instagram',
    twitter: '/social/twitter'
  };

  var placeholders = document.getElementsByClassName('js-social');

  var _loop = function _loop(i, len) {

    var namespace = placeholders[i].dataset.namespace;
    var node = document.getElementById('social-' + namespace);
    var options = node.dataset.options;
    var xhr = new XMLHttpRequest();

    // xhr.open('GET', `${routes[namespace]}?options=${options}`);
    xhr.open('GET', routes[namespace]);

    xhr.onload = function () {
      if (xhr.status === 200) node.outerHTML = xhr.responseText;else console.log(xhr.status);
    };

    xhr.send();
  };

  for (var i = 0, len = placeholders.length; i < len; i++) {
    _loop(i, len);
  }
};

/* Auto init */
document.addEventListener("DOMContentLoaded", function () {
  return window.IxSocial();
});
