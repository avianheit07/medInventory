var passport = require('passport')
  , Google   = require('passport-google-oauth').OAuth2Strategy

var verifyHandler = function (token, tokenSecret, profile, done) {
  process.nextTick(function () {
    var data = profile._json
    data.id = data.id.toString()
    User.findOne({_id: data.id}).exec(function (err, result) {
      if(result) {
        return done(null, result)
      } else {
        var allowed = false;
        if ((data.email.indexOf("@meditab.com")) > -1 || (data.email.indexOf("@cosmetisuite.com ")) > -1 || (data.email.indexOf("@suiterx.com")) > -1){
          allowed = true;
        }

        if(allowed) {
          data.role = [{role: 2}]
          User.create(data).exec(function (err, result){
            return done(err, result)
          })
        } else {
          return done({error:"email not allowed"}, null)
        }
      }
    });
  });
};

passport.serializeUser(function (user, done) {
  done(null, user);
});

passport.deserializeUser(function (user, done) {
  done(null, user);
  // User.findOne({id: id}, function (err, user) {
  //   done(err, user);
  // });
});

module.exports.http = {
  customMiddleware: function (app) {
    passport.use(new Google({
      clientID      : "229332452107-gvo6fegrrsbj9asr6q2lrmanjdnhopi5.apps.googleusercontent.com",
      clientSecret  : "OpoIdPAu8ZhPKQjWXYqCp9g6",
      callbackURL   : "http://localhost:1337/auth/google/callback"
    }, verifyHandler));

    app.use(passport.initialize());
    app.use(passport.session());
  }
};