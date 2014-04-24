scrollable-arrow
================

jQuery plugin displaying scrollable arrow mark on a block element.

# What this plugin do ?
![alt screenshot](https://github.com/bugcloud/scrollable-arrow/raw/master/screenshot.gif "ScreenShot")

## Snippet

```javascript
$(".scrollable-inner-content").scrollableArrow({
  parentBox: '.parent-box',
  leftArrow: '◀',
  rightArrow: '<img src="right-arrow.png">'
});
```

## Options

### parentBox
_(string)_ The selector string for parent box element.

This element will show the browser scroll bar when you don't use this plugin.

The default value is ```.scrollable-allow-parent-box```


### leftArrow, rightArrow
_(string)_ The content of arrow mark. You can use html string.

The default values are ```◀◀◀``` and ```▶▶▶```


### leftArrowClass, rightArrowClass
_(string)_ The class name for **leftArrow** and **rightArrow**

The default values are ```scrollable-arrow-left``` and ```scrollable-arrow-right```
