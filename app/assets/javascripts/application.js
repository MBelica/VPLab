//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require turbolinks
//= require activestorage

//= require_tree

$(document).on('turbolinks:load', function() {
    $(".alert-notice").delay(3500).slideUp(500);

    $(".nav-tabs a").click(function(){
        $(this).tab('show');
    });

    $('.nav-tabs a').on('shown.bs.tab', function(event){
        var x = $(event.target).text();
        var y = $(event.relatedTarget).text();
        $(".act span").text(x);
        $(".prev span").text(y);
    });

    if ($('.editable-form').data('mode') == 'read') {
        $('.editable-form').find(':input').not(':hidden, :input[type=submit]').each(function () {
            $(this).prop('disabled', true)
        });
    }

    $(".editable-form .editable-form-mode-switch").click(function(){
        console.log("test")
        $('.editable-form').ipe();
        return false;
    });

    $(".nav-tabs a").click(function(){
        $(this).tab('show');
    });

});


(function( $ ){
    $.fn.ipe = function() {
        if (this.data('mode') == 'write') {
            var mode = "read";
            var disable = true;

        } else {
            var mode = "write";
            var disable = false;
        }

        this.data('mode', mode);
        this.find(':input').not(':hidden, :input[type=submit]').each(function(){
            $(this).prop('disabled', disable);
        });
    };
})( jQuery );




