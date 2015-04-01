module.exports = 
  list: (req, res) ->
    Symptoms.find().exec (err, result) ->
      if err
        res.serverErr err

      res.json result

  create: (req, res) ->
    data = req.body
    console.log data, 'post'
    Symptoms.create data
    .exec (err, result) ->
      if err
        res.serverErr err

      if result
        res.json result