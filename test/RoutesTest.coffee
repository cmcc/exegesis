require 'should'
require 'mocha'
mongoose = require 'mongoose'
routes = require '../app/routes/Index'
models = require '../app/models/Models'


describe "routes", ->
	
	req = {}
	res =
		send: (text) ->
	
	beforeEach (done) ->
		mongoose.connect 'mongodb://localhost/words_test', ->
			models.Word.remove (err, data) ->
				done()
	
	describe "index", ->
		it "should display index with posts", (done) ->
			req.body = {spelling: 'test', definitions: 
			  [{definition:"a prohibition by injunction.", part_of_speech: "noun"}, {definition:"an emphatic directive or order.", part_of_speech: "noun"}]}
			res.send = (text) ->
					text.should.equal 'success'
					done()
			routes.index(req, res)