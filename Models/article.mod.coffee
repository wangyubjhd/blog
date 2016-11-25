db = require '.././db.coffee'
utils = require '.././utils.coffee'
logger = require('log4js').getLogger 'normal'

class article
  _table: () ->
    'articles'

  _schema: ()->
    title: {type: String, required: true},
    content: {type: String, required: true},
    category: {type: Number, default: 0},
    public_time: {type: Date, default: utils.now_stamp},
    pv: {type: Number, default: 0}

  constructor: ()->
    @model = db.makeSchema @_schema(), @_table()

  fetchById: (_id, cb) ->
    @model.findById _id, (err, info) ->
      logger.info err if err?
      cb info

  fetchAll: (cb) ->
    @model.find {}, (err, data) ->
      logger.info err if err?
      cb data

  doSave: (param, cb) ->
    e = new @model param
    e.save (err, res) ->
      logger.info err if err?
      cb res._id

  myUpdate: (op, param, cb) ->
    @model.update op, param, (err, rs)->
      logger.info err if err?
      cb rs.nModified


  myDelete: (_id) ->
    @model.remove {_id: _id}, (err) ->
      logger.info err if err?

exports.article = article
