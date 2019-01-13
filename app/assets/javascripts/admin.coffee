$(document).on 'turbolinks:load', ->

    $('.clickable-row').on 'click', ':not(.table-responsive-more)', ->
        window.location = $(this).parent().data('href')
        return;

    return;
