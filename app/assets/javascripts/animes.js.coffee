# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  # $('form').formValidation
  #   framework: 'bootstrap'
  #   icon:
  #     valid: 'glyphicon glyphicon-ok'
  #     invalid: 'glyphicon glyphicon-remove'
  #     validating: 'glyphicon glyphicon-refresh'
  #   fields:
  #     username: validators:
  #       notEmpty: message: 'The username is required'
  #       stringLength:
  #         min: 6
  #         max: 30
  #         message: 'The username must be more than 6 and less than 30 characters long'
  #       regexp:
  #         regexp: /^[a-zA-Z0-9_\.]+$/
  #         message: 'The username can only consist of alphabetical, number, dot and underscore'
  #     password: validators: notEmpty: message: 'The password is required'


  # $('.container').on 'cocoon:after-insert', (e, insertedItem) ->
  #   $(".video-upload").fileupload
  #     url: "/animes/upload_video"
  #     autoUpload : false
  #     fileInput: $(this)
  #     dataType: 'json'
  #     done: (e, data) ->
  #       $.each data.result.files, (index, file) ->
  #         $('<p/>').text(file.name).appendTo document.body
  #         return
  #       return

  #     progressall: (e, data) ->
  #       progress = parseInt(data.loaded / data.total * 100, 10)
  #       $(this).parent().parent().find('.progress-bar').css 'width', progress + '%'
  #       return

  #     add: (e, data) ->
  #       $('.uploadBtn').off('click').on 'click', ->
  #         data.submit()
  #         return
  #       return

  # return

$(document).ready(ready)
$(document).on('page:load', ready)