$(document).on "page:change", ->

  $(".select2").each (i, e) ->
    select = $(e)
    options = {
      initSelection: (element, callback) ->
        data = {id: element.data('current_id'), text: element.val()}
        callback(data)
      createSearchChoice: (term) ->
        return {id: term, text: term }
    }
    if select.hasClass("ajax")
      options.ajax =
        url: select.data("source")
        dataType: "json"
        data: (term, page) ->
          q: term
          page: page
        results: (data, page) ->
          results: data

    select.select2 options
    return
