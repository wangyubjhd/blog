model = require '../model/article.mod.coffee'
utils = require '.././utils.coffee'

class article
  _obj: ()->
    new model.article

  fetchOneArt: (_id, cb)->
    @_obj().fetchById _id, (art) ->
      if not art?
        cb '数据未查到', null
      else
        data =
          _id: art._id
          title: art.title
          content: art.content
          category: art.category
        cb null, data

  fetchArtList: (cb) ->
    @_obj().fetchAll (list) ->
      if not list?
        cb '数据未查到', null
      else
        cb null, list

  addArticle: (param, cb)->
    data =
      title: param.title,
      content: param.content,
      category: param.category
    if param._id? and param._id isnt ''
      op = {_id: param._id}
      @_obj().myUpdate op, data, (num) ->
        if num is 0
          cb '更新失败', null
        else
          cb null, param._id
    else
      @_obj().doSave data, (_id) ->
        cb null, _id


  deleteArticle: (_id) ->
    @_obj().myDelete _id

exports.article = article
