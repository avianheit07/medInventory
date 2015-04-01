module.exports = 
  list: (req, res) ->
    Logs.find().exec (err, result) ->
      Medicine.find().exec (err, meds) ->
        medIds = meds.map (value) -> return value.id

        result.forEach (value) ->
          if value.medicine.hasOwnProperty 'id'
            idx = medIds.indexOf value.medicine.id

            if idx > -1
              value.medicineDetails = meds[idx]

        if err
          res.serverErr err

        res.json result
  create: (req, res) ->
    data     = req.body
    data.inAttendance =
      email: data.inAttendance
    medicine = data.medicine
    delete data.medicine

    if medicine.count > 0 # greater than zero
      data.medicine =
        id: medicine.id
        count: data.count
        remainingAtTime: 0
        data: new Date()

      if medicine.count > data.count # can still be subtracted
        data.medicine.remainingAtTime = medicine.count - data.count
      else
        remaining = 0
        data.medicine.count = medicine.count
        data.medicine.remainingAtTime = 0

      Logs.create data
      .exec (err, result) ->
        console.log err, result
        if err
          res.serverErr err

        if result
          medicine.count = data.medicine.remainingAtTime
          Medicine.update id: medicine.id
          , medicine, (err, result) ->
            res.json result
    else
      res.json null

  show: (req, res) ->
    id = req.param 'id'
    if id?
      Logs.find( "medicine.id": id ).exec (err, result) ->
        res.serverErr err if err
        res.json result
    else
      res.json []