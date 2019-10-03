$(document).on 'turbolinks:load', ->
  $('.update_video input').bind 'blur', ->
    $('.update_video').submit()

  $('.update_video').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'PUT'
        dataType: 'json',
        data: $(".update_video").serialize()
        success: (data, text, jqXHR) ->
          Materialize.toast('Vídeo atualizado', 4000, 'green')
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problema na atualização do vídeo', 4000, 'red')
    return false

  $('.remove_video').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'DELETE'
        dataType: 'json',
        data: {}
        success: (data, text, jqXHR) ->
          $(location).attr('href','/videos');
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problema na remoção do vídeo', 4000, 'red')
    return false