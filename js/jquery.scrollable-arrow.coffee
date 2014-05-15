###
# scrollable-allow
#
# jQuery plugin displaying scrollable arrow mark on a block element.
# https://github.com/bugcloud/scrollable-arrow
###

$ = jQuery
$.fn.scrollableArrow = (opt) ->
  default_options =
    parentBox: '.scrollable-allow-parent-box'
    leftArrow: '◀◀◀'
    rightArrow: '▶▶▶'
    leftArrowClass: 'scrollable-arrow-left'
    rightArrowClass: 'scrollable-arrow-right'

  options = $.extend {}, default_options, opt
  this.each () ->
    $that_ = $(this)
    $parent = $that_.parents "#{options.parentBox}:first"
    parentSize =
      width: $parent.width()
      height: $parent.height()
    realContextSize =
      width: $that_.width()
      height: $that_.height()
    currentPositionStyle = $that_.css 'position'
    $that_.css 'position', 'absolute'
    $that_.css 'position', currentPositionStyle

    arrowsHtml = """
      <div class='scrollable-arrows-container'>
        <div class='#{options.leftArrowClass}'>#{options.leftArrow}</div>
        <div class='#{options.rightArrowClass}'>#{options.rightArrow}</div>
      </div>
    """
    $parent.prepend "<div class='scrollable-arrows-wrapper'></div>"
    $wrapper = $parent.find '.scrollable-arrows-wrapper'
    $wrapper.css
      background: "transparent"
      height: "#{parentSize.height}px"
      width: "#{parentSize.width}px"
      overflow: "auto"
    $parent.prepend arrowsHtml
    $that_.detach().appendTo $wrapper
    $parent.find(".#{options.leftArrowClass}").remove() if options.leftArrow is false
    $parent.find(".#{options.rightArrowClass}").remove() if options.rightArrow is false

    $arrows = $parent.find '.scrollable-arrows-container'
    $arrows.css
      position: 'relative'
      height: 0
      width: "#{parentSize.width}px"
    $leftArrow = $arrows.find ".#{options.leftArrowClass}"
    $leftArrow.css
      position: 'absolute'
      left: 0
      top: 0
      display: 'none'
    $rightArrow = $arrows.find ".#{options.rightArrowClass}"
    $rightArrow.css
      position: 'absolute'
      right: 0
      top: 0

    setInterval () ->
      scrollLeft = $wrapper.scrollLeft()
      if scrollLeft is 0
        if $leftArrow.is(':visible')
          $leftArrow.hide()
          $leftArrow.trigger 'sa.hide'
      else
        unless $leftArrow.is(':visible')
          $leftArrow.show()
          $leftArrow.trigger 'sa.show'

      if scrollLeft + parentSize.width >= realContextSize.width
        if $rightArrow.is(':visible')
          $rightArrow.hide()
          $rightArrow.trigger 'sa.hide'
      else
        unless $rightArrow.is(':visible')
          $rightArrow.show()
          $rightArrow.trigger 'sa.show'
    , 200

