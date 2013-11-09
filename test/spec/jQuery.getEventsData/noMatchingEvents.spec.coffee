describe.only "jQuery.getEventsData - `host` has no matching events attached", ->
	expect = chai.expect
	method = jQuery.getEventsData
	setupHosts = method.setupHosts
	forEach = method.Host.forEach
	notValid = undefined
	handler0 = ->

	beforeEach -> @hosts = setupHosts().someEvents

	describe "two parameters passed", ->
		# method(host, notValid)
		it "should return `undefined` if the second parameter isn't valid", ->
			forEach @hosts, (host) ->
				expect(method host, notValid).to.be.undefined

		describe "the second parameter is a string or a function", ->
			# method(host, handler0)
			it "should return `undefined` if it's a non attached handler", ->
				forEach @hosts, (host) ->
					expect(method host, handler0).to.be.undefined

			describe "the second parameter is a string", ->
				# method(host, "")
				it "should return `undefined` if it's not a valid string", ->
					forEach @hosts, (host) ->
						expect(method host, "").to.be.undefined
				# method(host, "name0")
				it "should return `undefined` if it's a non attached name", ->
					forEach @hosts, (host) ->
						expect(method host, "name0").to.be.undefined

				describe "`host` has no namespaced events attached", ->
					beforeEach -> @hosts = @hosts.noNamespaced

					# method(host, ".namespace0")
					it "should return `undefined` if it's a non attached namespace", ->
						forEach @hosts, (host) ->
							expect(method host, ".namespace0").to.be.undefined
					# method(host, "name0.namespace0")
					it "should return `undefined` if it's both non attached name and namespace", ->
						forEach @hosts, (host) ->
							expect(method host, "name0.namespace0").to.be.undefined
					# method(host, "nameN.namespace0")
					it "should return `undefined` if it's an attached name and a non attached namespace", ->
						forEach @hosts, "names", (host, name) ->
							expect(method host, "#{name}.namespace0").to.be.undefined

				describe "`host` has some namespaced events attached", ->
					beforeEach -> @hosts = @hosts.someNamespaced

					# method(host, ".namespace0")
					it "should return `undefined` if it's a non attached namespace", ->
						forEach @hosts, (host) ->
							expect(method host, ".namespace0").to.be.undefined
					# method(host, "name0.namespace0")
					it "should return `undefined` if it's both non attached name and namespace", ->
						forEach @hosts, (host) ->
							expect(method host, "name0.namespace0").to.be.undefined
					# method(host, "nameN.namespace0")
					it "should return `undefined` if it's an attached name and a non attached namespace", ->
						forEach @hosts, "names", (host, name) ->
							expect(method host, "#{name}.namespace0").to.be.undefined
					# method(host, "name0.namespaceN")
					it "should return `undefined` if it's a non attached name and an attached namespace", ->
						forEach @hosts, "namespaces", (host, namespace) ->
							expect(method host, "name0#{namespace}").to.be.undefined

	describe "three parameters passed", ->

		describe "`event` isn't a string", ->
			# method(host, notValid, notValid)
			it "should return `undefined` if `handler` isn't a function", ->
				forEach @hosts, (host) ->
					expect(method host, notValid, notValid).to.be.undefined

			describe "`handler` is a function", ->
				# method(host, notValid, handler0)
				it "should return `undefined` if it's a non attached handler", ->
					forEach @hosts, (host) ->
						expect(method host, notValid, handler0).to.be.undefined
				# method(host, notValid, handlerN)
				it "should return `undefined` if it's an attached handler", ->
					forEach @hosts, "handlers", (host, handler) ->
						expect(method host, notValid, handler).to.be.undefined

		describe "`event` is a string", ->

			describe "`event` isn't a valid string", ->
				# method(host, "", notValid)
				it "should return `undefined` if `handler` isn't a function", ->
					forEach @hosts, (host) ->
						expect(method host, "", notValid).to.be.undefined

				describe "`handler` is a function", ->
					# method(host, "", handler0)
					it "should return `undefined` if it's a non attached handler", ->
						forEach @hosts, (host) ->
							expect(method host, "", handler0).to.be.undefined
					# method(host, "", handlerN)
					it "should return `undefined` if it's an attached handler", ->
						forEach @hosts, "handlers", (host, handler) ->
							expect(method host, "", handler).to.be.undefined

			describe "`event` is a valid string", ->

				describe "`handler` isn't a function", ->
					# method(host, "name0", notValid)
					it "should return `undefined` if `event` is a non attached name", ->
						forEach @hosts, (host) ->
							expect(method host, "name0", notValid).to.be.undefined
					# method(host, "nameN", notValid)
					it "should return `undefined` if `event` is an attached name", ->
						forEach @hosts, "names", (host, name) ->
							expect(method host, name, notValid).to.be.undefined

					describe "`host` has no namespaced events attached", ->
						beforeEach -> @hosts = @hosts.noNamespaced

						# method(host, ".namespace0", notValid)
						it "should return `undefined` if `event` is a non attached namespace", ->
							forEach @hosts, (host) ->
								expect(method host, ".namespace0", notValid).to.be.undefined
						# method(host, "name0.namespace0", notValid)
						it "should return `undefined` if `event` is both non attached name and namespace", ->
							forEach @hosts, (host) ->
								expect(method host, "name0.namespace0", notValid).to.be.undefined
						# method(host, "nameN.namespace0", notValid)
						it "should return `undefined` if `event` is an attached name and a non attached namespace", ->
							forEach @hosts, "names", (host, name) ->
								expect(method host, "#{name}.namespace0", notValid).to.be.undefined

					describe "`host` has some namespaced events attached", ->
						beforeEach -> @hosts = @hosts.someNamespaced

						# method(host, ".namespace0", notValid)
						it "should return `undefined` if `event` is a non attached namespace", ->
							forEach @hosts, (host) ->
								expect(method host, ".namespace0", notValid).to.be.undefined
						# method(host, "name0.namespace0", notValid)
						it "should return `undefined` if `event` is both non attached name and namespace", ->
							forEach @hosts, (host) ->
								expect(method host, "name0.namespace0", notValid).to.be.undefined
						# method(host, "nameN.namespace0", notValid)
						it "should return `undefined` if `event` is an attached name and a non attached namespace", ->
							forEach @hosts, "names", (host, name) ->
								expect(method host, "#{name}.namespace0", notValid).to.be.undefined
						# method(host, "name0.namespaceN", notValid)
						it "should return `undefined` if `event` is a non attached name and an attached namespace", ->
							forEach @hosts, "namespaces", (host, namespace) ->
								expect(method host, "name0#{namespace}", notValid).to.be.undefined

				describe "`handler` is a function", ->

					describe "`handler` is a non attached handler", ->
						# method(host, "name0", handler0)
						it "should return `undefined` if `event` is a non attached name", ->
							forEach @hosts, (host) ->
								expect(method host, "name0", handler0).to.be.undefined
						# method(host, "nameN", handler0)
						it "should return `undefined` if `event` is an attached name", ->
							forEach @hosts, "names", (host, name) ->
								expect(method host, name, handler0).to.be.undefined

						describe "`host` has no namespaced events attached", ->
							beforeEach -> @hosts = @hosts.noNamespaced

							# method(host, ".namespace0", handler0)
							it "should return `undefined` if `event` is a non attached namespace", ->
								forEach @hosts, (host) ->
									expect(method host, ".namespace0", handler0).to.be.undefined
							# method(host, "name0.namespace0", handler0)
							it "should return `undefined` if `event` is both non attached name and namespace", ->
								forEach @hosts, (host) ->
									expect(method host, "name0.namespace0", handler0).to.be.undefined
							# method(host, "nameN.namespace0", handler0)
							it "should return `undefined` if `event` is an attached name and a non attached namespace", ->
								forEach @hosts, "names", (host, name) ->
									expect(method host, "#{name}.namespace0", handler0).to.be.undefined

						describe "`host` has some namespaced events attached", ->
							beforeEach -> @hosts = @hosts.someNamespaced

							# method(host, ".namespace0", handler0)
							it "should return `undefined` if `event` is a non attached namespace", ->
								forEach @hosts, (host) ->
									expect(method host, ".namespace0", handler0).to.be.undefined
							# method(host, "name0.namespace0", handler0)
							it "should return `undefined` if `event` is both non attached name and namespace", ->
								forEach @hosts, (host) ->
									expect(method host, "name0.namespace0", handler0).to.be.undefined
							# method(host, "nameN.namespace0", handler0)
							it "should return `undefined` if `event` is an attached name and a non attached namespace", ->
								forEach @hosts, "names", (host, name) ->
									expect(method host, "#{name}.namespace0", handler0).to.be.undefined
							# method(host, "name0.namespaceN", handler0)
							it "should return `undefined` if `event` is a non attached name and an attached namespace", ->
								forEach @hosts, "namespaces", (host, namespace) ->
									expect(method host, "name0#{namespace}", handler0).to.be.undefined

					describe "`handler` is an attached handler", ->
						# method(host, "name0", handlerN)
						it "should return `undefined` if `event` is a non attached name", ->
							forEach @hosts, "handlers", (host, handler) ->
								expect(method host, "name0", handler).to.be.undefined

						describe "`host` has no namespaced events attached", ->
							beforeEach -> @hosts = @hosts.noNamespaced

							# method(host, ".namespace0", handlerN)
							it "should return `undefined` if `event` is a non attached namespace", ->
								forEach @hosts, "handlers", (host, handler) ->
									expect(method host, ".namespace0", handler).to.be.undefined
							# method(host, "name0.namespace0", handlerN)
							it "should return `undefined` if `event` is both non attached name and namespace", ->
								forEach @hosts, "handlers", (host, handler) ->
									expect(method host, "name0.namespace0", handler).to.be.undefined
							# method(host, "nameN.namespace0", handlerN)
							it "should return `undefined` if `event` is an attached name and a non attached namespace", ->
								forEach @hosts, "names+handlers", (host, name, handler) ->
									expect(method host, "#{name}.namespace0", handler).to.be.undefined

						describe "`host` has some namespaced events attached", ->
							beforeEach -> @hosts = @hosts.someNamespaced

							# method(host, ".namespace0", handlerN)
							it "should return `undefined` if `event` is a non attached namespace", ->
								forEach @hosts, "handlers", (host, handler) ->
									expect(method host, ".namespace0", handler).to.be.undefined
							# method(host, "name0.namespace0", handlerN)
							it "should return `undefined` if `event` is both non attached name and namespace", ->
								forEach @hosts, "handlers", (host, handler) ->
									expect(method host, "name0.namespace0", handler).to.be.undefined
							# method(host, "nameN.namespace0", handlerN)
							it "should return `undefined` if `event` is an attached name and a non attached namespace", ->
								forEach @hosts, "names+handlers", (host, name, handler) ->
									expect(method host, "#{name}.namespace0", handler).to.be.undefined
							# method(host, "name0.namespaceN", handlerN)
							it "should return `undefined` if `event` is a non attached name and an attached namespace", ->
								forEach @hosts, "namespaces+handlers", (host, namespace, handler) ->
									expect(method host, "name0#{namespace}", handler).to.be.undefined
