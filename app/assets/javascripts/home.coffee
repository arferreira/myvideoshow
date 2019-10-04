updateView = ->
  $.ajax
    type: 'POST'
    url: '/increment/views/'
    dataType: 'json'
    data: 'video': $('#video').val()
    success: (response) ->
      ok = response.ok
      count = response.count
      if ok == true
        $('#count_views').text count + ' visualizações'
      return
    error: (xhr, status) ->
      console.log 'erro ao salvar view'
      return
  return

$(document).ready ->
  if window.location.pathname.includes('/assistir')
    player = videojs('show-video')
    player.play()
    player.on 'play', ->
      updateView()
      return
  return