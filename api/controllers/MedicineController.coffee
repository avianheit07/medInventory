module.exports =
  list: (req, res) ->
    Medicine.find().exec (err, result) ->
      if err
        res.serverErr err

      res.json result

  create: (req, res) ->
    data = req.body

    Medicine.create data
    .exec (err, result) ->
      if err
        res.serverErr err
        return

      if result
        res.json result
