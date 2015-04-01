module.exports = 
  create: (req, res) ->
    role = req.body
    Role.create role
    .exec (err, result) ->
      unless err
        res.json result
      else
        res.json null
  list: (req, res) ->
    Role.find().exec (err, result) ->
      res.json result
  show: (req, res) ->
    console.log 'here'
  update: (req, res) ->
    console.log 'here'