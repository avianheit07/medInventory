module.exports = 
  list: (req, res) ->

  show: (req, res) ->
    id = req.param 'id'
    console.log 'show', id
    Inquiry.find( inquirer: id).exec (err, result) ->
      if req.isSocket
        sails.sockets.join req.socket, "inquiry/#{id}"

      res.json result

  create: (req, res) ->
    data   = req.body
    if req.method? 
      if req.method is 'POST'
        console.log 'POST'
        Inquiry.create data
        .exec (err, result) ->
          unless err and !result
            sails.sockets.broadcast "inquiry/#{data.inquirer}"
      else
        console.log 'PUT', data
        Inquiry.update id: data.id, data
        .exec (err, result) ->
          unless err and !result
            sails.sockets.broadcast "inquiry/#{data.inquirer}"
