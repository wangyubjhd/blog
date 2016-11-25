router = require('express').Router();
Posts = require '../Models/posts.coffee';

router.get '/404', (req, res) ->
  res.render '404'

router.get '/', (req, res) ->
  res.render 'index'

router.get '/show', (req, res) ->
  res.render 'show'

router.get '/list', (req, res) ->
  res.render 'list'

router.get '/admin/login', (req, res) ->
  res.render 'admin/login'

router.get '/admin', (req, res) ->
  res.render 'admin/index'

router.post '/admin/add', (req, res) ->
  M = new Posts
  data = M.create req.body
  res.render 'admin/add', {data : data}

router.get '/admin/update', (req, res) ->
  res.render 'admin/update'

router.get '/admin/del', (req, res) ->
  res.ajax data

module.exports = router;