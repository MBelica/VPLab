$(document).on 'turbolinks:load', ->
    $('#experiments-table').DataTable(
        "order": [[0, "desc"]],
        responsive: true)
;
