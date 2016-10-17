@ProxyStore = @alt.createStore
  displayName: 'ProxyStore'
  state:
    proxies: []
    error: null

  bindListeners:
    fetchProxies: ProxyActions.FETCH_PROXIES
    updateProxies: ProxyActions.UPDATE_PROXIES
    failedProxies: ProxyActions.FAILED_PROXIES

  fetchProxies:  -> @setState proxies: []
  updateProxies: (proxies) -> @setState proxies: proxies
  failedProxies: (message) -> @setState error: message

  publicMethods:
    hasProxies: -> ! !@getState().proxies.length

