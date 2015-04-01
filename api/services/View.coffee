roles = [
  "public"
  "admin"
  "employee"
  "nurse"
  "subnurse"
]

View =
  render: (req, res) ->
    base      = req.headers.host
    user_data = req.session.passport
    console.log 'rendering here'
    if user_data and user_data.role
      ###
      determine the active sessionType this user is using
      ###
      console.log user_data.role
      res.view roles[user_data.role[0].role], base:base
    else
      console.log roles[0]
      res.view roles[0], base:base

module.exports = View