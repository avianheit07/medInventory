/**
 * grunt/pipeline.js
 *
 * The order in which your css, javascript, and template files should be
 * compiled and linked from your views and static HTML files.
 *
 * (Note that you can take advantage of Grunt-style wildcard/glob/splat expressions
 * for matching multiple files.)
 */



// CSS files to inject in order
//
// (if you're using LESS with the built-in default config, you'll want
//  to change `assets/styles/importer.less` instead.)


// Client-side javascript files to inject in order
// (uses Grunt-style wildcard/glob/splat expressions)


// Client-side HTML templates are injected using the sources below
// The ordering of these templates shouldn't matter.
// (uses Grunt-style wildcard/glob/splat expressions)
//
// By default, Sails uses JST templates and precompiles them into
// functions for you.  If you want to use jade, handlebars, dust, etc.,
// with the linker, no problem-- you'll just want to make sure the precompiled
// templates get spit out to the same file.  Be sure and check out `tasks/README.md`
// for information on customizing and installing new tasks.

var users = {
  public:{
    css:[
      'lib/angular-material/angular-material.min.css',
      'styles/dependencies/**/*.css',
      'styles/admin/**/*.css'
    ],
    js:[
      'lib/angular/angular.js',
      'lib/angular/*.js',
      'lib/lodash/*.js',
      'lib/angular-material/angular-material.min.js',
      'lib/angular-material/angular-material.js',
      'lib/angular-aria/angular-aria.min.js',
      'lib/angular-aria/angular-aria.js',
      'lib/angular-messages/angular-messages.min.js',
      'lib/angular-messages/angular-messages.js',
      'js/public/app.js',
      'js/public/app.js',
      'js/public/**/*.js',
      'js/common/**/*.js'
    ],
    templates:[
      'public/**/*.html',
      'common/**/*.html'
    ]
  },
  admin:{
    css:[
      'lib/angular-material/angular-material.min.css',
      'styles/dependencies/**/*.css',
      'styles/admin/**/*.css'
    ],
    js:[
      'lib/angular/angular.js',
      'lib/angular/*.js',
      'lib/lodash/*.js',
      'lib/angular-material/angular-material.min.js',
      'lib/angular-material/angular-material.js',
      'lib/angular-aria/angular-aria.min.js',
      'lib/angular-aria/angular-aria.js',
      'lib/angular-messages/angular-messages.min.js',
      'lib/angular-messages/angular-messages.js',
      'js/admin/app.js',
      'js/admin/**/*.js',
      'js/common/**/*.js'
    ],
    templates:[
      'admin/**/*.html',
      'common/**/*.html'
    ]
  },
  nurse:{
    css:[
      'dependencies/**/*.css',
      'common/**/**/*.css',
      'common/**/*.css',
      'nurse/**/*.css'
    ],
    js:[
      'dependencies/socket.io.js',
      'dependencies/angular/angular.js',
      'dependencies/angular/*.js',
      'dependencies/lodash/*.js',
      'dependencies/sails.io.js',
      'nurse/app.js',
      'nurse/**/*.js',
      'common/**/*.js'
    ],
    templates:[
      'nurse/**/*.html',
      'common/**/*.html'
    ]
  },
  employee:{
    css:[
      'dependencies/**/*.css',
      'common/**/**/*.css',
      'common/**/*.css',
      'employee/**/*.css'
    ],
    js:[
      'dependencies/socket.io.js',
      'dependencies/angular/angular.js',
      'dependencies/angular/*.js',
      'dependencies/lodash/*.js',
      'dependencies/sails.io.js',
      'employee/app.js',
      'employee/**/*.js',
      'common/**/*.js'
    ],
    templates:[
      'employee/**/*.html',
      'common/**/*.html'
    ]
  }
}

for(var key in users){
  users[key].css = users[key].css.map(function(path){
    return ".tmp/public/"+path;
  })
  users[key].js = users[key].js.map(function(path){
    return ".tmp/public/"+path;
  })
  users[key].templates = users[key].templates.map(function(path){
    return ".tmp/public/templates/"+path;
  })

}

// Prefix relative paths to source files so they point to the proper locations
// (i.e. where the other Grunt tasks spit them out, or in some cases, where
// they reside in the first place)

module.exports.users = users;