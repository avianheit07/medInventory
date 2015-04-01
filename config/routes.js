var toUnk = [
  "/:unk"
]

routes = {
  '/': {
    controller: 'SiteController',
    action:'index'
  },
  'get /login': {
    controller: 'SiteController',
    action: 'index'
  },
  'get /logout': {
    controller: 'AuthController',
    action: 'logout'
  }
};

toUnk.forEach(function(url){
  routes[url] = {
    controller: 'SiteController',
    action: 'index',
    skipAssets: true
  }
});

module.exports.routes = routes;