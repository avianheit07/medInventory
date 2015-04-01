module.exports = 
  create: (req, res) ->
    console.log 'create'

  list: (req, res) ->
    User.find().exec (err, result) ->
      console.log result, "RESULTS"
      res.json result

  show: (req, res) ->
    console.log 'show'

  update: (req, res) ->
    console.log 'update'
