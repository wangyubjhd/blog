mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/blog'
Schema = mongoose.Schema

class Posts
  constructor : ()->
    @_init()


  _init : ()->
    if not @model
      @model = mongoose.model @_name(), @_schema(), @_name()
    else
      @model = mongoose.model @_name()

  _name : ()->
    'post'

  _schema : ()->
    construct =
      title : {type : String, require : true},
      content : {type : String, require : true},
      pv : {type : Number, default : 0},
      public_time : {type : Date, default : Date.now()}
      category : {type : Number, require : true}
    new Schema construct

module.exports = Posts