@ProxyActions = @alt.createActions
  fetchProxies: ->
    (dispatch) =>
      dispatch()
      request { url: "http://localhost:3000/proxies", json: true }, (er, res, body) =>
        if er then @failedProxies(er) else @updateProxies(body)

  updateProxies: (proxies) -> proxies
  failedProxies: (message) -> message

