// Generated by CoffeeScript 1.7.1

/*
 * scrollable-allow
 *
 * jQuery plugin displaying scrollable arrow mark on a block element.
 * https://github.com/bugcloud/scrollable-arrow
 */

(function() {
  var $;

  $ = jQuery;

  $.fn.scrollableArrow = function(opt) {
    var default_options, options;
    default_options = {
      parentBox: '.scrollable-allow-parent-box',
      leftArrow: '◀◀◀',
      rightArrow: '▶▶▶',
      leftArrowClass: 'scrollable-arrow-left',
      rightArrowClass: 'scrollable-arrow-right'
    };
    options = $.extend({}, default_options, opt);
    return this.each(function() {
      var $arrows, $leftArrow, $parent, $rightArrow, $that_, $wrapper, arrowsHtml, currentPositionStyle, parentSize, realContextSize;
      $that_ = $(this);
      $parent = $that_.parents("" + options.parentBox + ":first");
      parentSize = {
        width: $parent.width(),
        height: $parent.height()
      };
      currentPositionStyle = $that_.css('position');
      $that_.css('position', 'absolute');
      realContextSize = {
        width: $that_.width(),
        height: $that_.height()
      };
      $that_.css('position', currentPositionStyle);
      arrowsHtml = "<div class='scrollable-arrows-container'>\n  <div class='" + options.leftArrowClass + "'>" + options.leftArrow + "</div>\n  <div class='" + options.rightArrowClass + "'>" + options.rightArrow + "</div>\n</div>";
      $parent.prepend("<div class='scrollable-arrows-wrapper'></div>");
      $wrapper = $parent.find('.scrollable-arrows-wrapper');
      $wrapper.css({
        background: "transparent",
        height: "" + parentSize.height + "px",
        width: "" + parentSize.width + "px",
        overflow: "auto"
      });
      $parent.prepend(arrowsHtml);
      $that_.detach().appendTo($wrapper);
      if (options.leftArrow === false) {
        $parent.find("." + options.leftArrowClass).remove();
      }
      if (options.rightArrow === false) {
        $parent.find("." + options.rightArrowClass).remove();
      }
      $arrows = $parent.find('.scrollable-arrows-container');
      $arrows.css({
        position: 'relative',
        height: 0,
        width: "" + parentSize.width + "px"
      });
      $leftArrow = $arrows.find("." + options.leftArrowClass);
      $leftArrow.css({
        position: 'absolute',
        left: 0,
        top: 0,
        display: 'none'
      });
      $rightArrow = $arrows.find("." + options.rightArrowClass);
      $rightArrow.css({
        position: 'absolute',
        right: 0,
        top: 0
      });
      return setInterval(function() {
        var scrollLeft;
        scrollLeft = $wrapper.scrollLeft();
        if (scrollLeft === 0) {
          if ($leftArrow.is(':visible')) {
            $leftArrow.hide();
          }
        } else {
          if (!$leftArrow.is(':visible')) {
            $leftArrow.show();
          }
        }
        if (scrollLeft + parentSize.width >= realContextSize.width) {
          if ($rightArrow.is(':visible')) {
            return $rightArrow.hide();
          }
        } else {
          if (!$rightArrow.is(':visible')) {
            return $rightArrow.show();
          }
        }
      }, 200);
    });
  };

}).call(this);
