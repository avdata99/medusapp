/*global jQuery*/

var THEME_VERSION = '1.2.8';

jQuery(function ($) {
    "use strict";
    var position;

    $('.gc-full-width').click(function () {

        $(this).find('i.fa:first').toggleClass('fa-expand');
        $(this).find('i.fa:first').toggleClass('fa-compress');

        if ($(this).closest('.container').hasClass('container-full')) {
            $(this).closest('.container').removeClass('container-full');
            var scroll_top = $(this).closest('.container').offset().top - 10;
            $('html,body').animate({scrollTop: scroll_top}, 750);

            return true;
        }

        position = $(this).closest('.container').offset();

        $(this).closest('.container')
            .css('left', position.left + 'px')
            .css('top', position.top + 'px')
            .addClass('container-before-resize');

        $('html,body').animate({scrollTop: '0'}, 750);
        $(this).closest('.container').animate({
            width: '100%',
            top: '0',
            opacity: '1',
            left: '0',
            marginLeft: '0',
            paddingTop: '10px',
            background: '#FFF'
        }, 1000)
            .promise().done(function () {
                $(this).removeClass('container-before-resize');
                $(this).addClass('container-full');
                $(this).removeAttr('style');
            });
    });

    $('.minimize-maximize').click(function () {
        $(this).find('i').toggleClass('fa-caret-down');
        $(this).find('i').toggleClass('fa-caret-up');

        $(this).closest('.container').find('.table-container:first').slideToggle('slow');
    });

    $('.gc-full-width').hover(
        function () {
            $(this).find('i.fa:first').addClass('fa-lg');
        },
        function () {
            $(this).find('i.fa:first').removeClass('fa-lg');
        }
    );
});