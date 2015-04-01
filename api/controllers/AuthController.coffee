passport = require "passport"

module.exports = 
  index: (req, res) ->
    View.render req, res

  logout: (req, res) ->
    req.session.destroy (err) ->
      req.logout()
      res.redirect '/'

  google: (req, res) ->
    passport.authenticate('google', failureRedirect: '/', scope: ["https://www.googleapis.com/auth/plus.login", "https://www.googleapis.com/auth/userinfo.profile", "https://www.googleapis.com/auth/userinfo.email" ], (err, user) ->
      console.log user
      req.session.passport = user
      req.logIn user, (err) ->
        if err
          req.session.passport = null
        res.redirect '/'
      )(req, res)
  logged: (req,res)->
    console.log req.session
    res.json session: req.session.passport