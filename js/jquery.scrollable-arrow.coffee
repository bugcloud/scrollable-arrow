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
    currentPositionStyle = $that_.css 'position'
    $that_.css 'position', 'absolute'
    realContextSize =
      width: $that_.width()
      height: $that_.height()
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
        $leftArrow.hide() if $leftArrow.is(':visible')
      else
        $leftArrow.show() unless $leftArrow.is(':visible')

      if scrollLeft + parentSize.width >= realContextSize.width
        $rightArrow.hide() if $rightArrow.is(':visible')
      else
        $rightArrow.show() unless $rightArrow.is(':visible')
    , 200

