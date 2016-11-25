PostsDaos = require '../Daos/posts.coffee'

class Posts
  create: (param)->
    daos = new PostsDaos
    daos.model.create param, (err) ->
      if err?
        console.log err

      return 1111


  delete: ()->

  update: () ->

  find: () ->

  findAll : () ->


module.exports = Posts