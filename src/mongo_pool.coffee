## Mongo.DB Related ##
MongoClient = require('mongodb').MongoClient

# Mongo Connection
MongoPool = ->
  
  conn = null
  config = null

  @set_config = (cfg) ->
  	config = cfg
  	
  @getConnection = (database, callback) ->
    url = "mongodb://#{config.url}:#{config.port}/#{database}"
    MongoClient.connect url, (err, db) ->
      callback conn = db

  @db = (database, callback) ->
    return @getConnection database, callback if conn is null
    callback conn.db database

  return this

module.exports = do MongoPool