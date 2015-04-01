Symptoms = 
  adapter: "mongo"
  schema: true
  attributes:
    id: 
      type: "string"
      primaryKey: true
    email: "string"
    given_name: "string"
    family_name: "string"
    picture: "string"
    role: "array"

module.exports = Symptoms