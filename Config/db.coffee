mongoose = require 'mongoose'
mongoose.Promise = require('q').Promise;
mongoose.connect "mongodb://localhost/nn"

exports.makeSchema = (list, tbl)->
  schema = mongoose.Schema list, {versionKey:false}
  if @model? then @model else @model = mongoose.model tbl, schema


