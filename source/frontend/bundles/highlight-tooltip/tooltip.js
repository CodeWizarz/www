// NOTE: This import is not strictly needed, but in the future if we need
// to access non-default-exported functions (e.g. `detectOverflow`), it will be.
import { createPopper } from '@popperjs/core';
import buildTweetHref from './build-tweet-href'
import buildEditHref from './build-edit-href'
import buildWebIdeHref from './build-web-ide-href'

export default () => {
  'use strict'

  if (isIeNotEdge()) {
    return
  }

  if (document.readyState !== 'loading') {
    setupEventListeners()
  } else {
    document.addEventListener('DOMContentLoaded', function (event) {
      setupEventListeners()
    })
  }

  function isIeNotEdge() {
    const userAgent = navigator.userAgent
    if (userAgent.indexOf('Edg') != -1) {
      // The omitted "e" is intentional, some versions seem to omit it, e.g.:
      // "... Edg/80.0.361.50"
      return false
    }
    if (userAgent.indexOf('MSIE') != -1) {
      // IE < 11
      return true
    }
    if (userAgent.indexOf('Trident') != -1) {
      // IE = 11
      return true
    }
    return false
  }

  function setupEventListeners() {
    document.body.addEventListener('mouseup', onMouseUp);
    window.addEventListener('scroll', onScroll)
    document.scrollingElement.addEventListener('scroll', onScroll)
    document.body.addEventListener('keyup', onKeyup)
    document.body.addEventListener('selectionChange', onSelectionChange)
    document.querySelector('#highlight-tooltip').setAttribute('initialized', '')
  }

  function onMouseUp(event) {
    // NOTE: The order of the logic in this method is very important.  The
    // various checks, guard clauses, and hide/show calls must be done in the
    // correct order, or else things don't work right.

    // If we clicked on the tooltip itself, don't do anything
    const clickedTooltip = $(event.target).closest('.highlight-tooltip-link').length !== 0
    if (clickedTooltip) {
      return
    }

    const hasValidSelection = getBoundingClientRect().width > 1

    const newBoundingClientRect = getBoundingClientRect()
    const selectionIsUnchanged = tooltipIsShowing() &&
      areRectsEqual(window.tooltipPopper.currentBoundingClientRect, newBoundingClientRect)

    // At this point, we may be doing any one of these things:
    // 1. Making a new selection when there wasn't one before
    // 2. Making a different selection when there is already one existing.
    // 3. Clicking outside existing selection to make it go away
    // 4. Clicking INSIDE an existing selection to make it go away
    // However, when you click/drag the mouse to make or remove a selection,
    // the current selection *does not* go away before the click event fires.
    // Thus, we don't always know exactly which type of click event is happening
    // without doing extra and unnecessary click-location and state tracking.
    // Instead, we always start by hiding any existing tooltip, then redisplaying it,
    // since that's the cheapest and easiest thing to do
    hideTooltip()

    // we only want to do the tooltip when highlighting page content, not
    // the nav, header, or anything else.  So if we clicked anywhere else,
    // don't proceed to show it.
    const clickedOnMarkdownPage = $(event.target).closest('.md-page').length !== 0
    if (!clickedOnMarkdownPage) {
      return
    }

    // If we don't have a valid selection, we don't want to show the tooltip
    if (!hasValidSelection) {
      return
    }

    // If we clicked on the same selection, it will be going away (but hasn't
    // yet, because mouseup fires BEFORE the selection is gone),
    // so we don't want to show the tooltip, and we will exit before we
    // (re)create the tooltip.
    // BUT, if we are holding down the shift key, that means we are
    // changing the selection, and it WON'T be going away, so we need to
    // continue on to (re)create the tooltip.
    if (selectionIsUnchanged && !event.shiftKey) {
      return
    }

    // If we got to here, we want to show the tooltip, then update its position
    showTooltip()
    window.tooltipPopper.update()
  }

  function onScroll() {
    updatePopperIfItExists()
  }

  function onKeyup() {
    updatePopperIfItExists()
  }

  function onSelectionChange() {
    updatePopperIfItExists()
  }

  function updatePopperIfItExists() {
    if (!window.tooltipPopper) {
      // there is no tooltip currently shown; no action needed
      return
    }

    window.tooltipPopper.update()
  }

  function tooltipIsShowing() {
    // ensure a boolean is returned, never undefined
    return !!window.tooltipPopper
  }

  function getBoundingClientRect() {
    const selection = document.getSelection()
    const range = selection && selection.rangeCount && selection.getRangeAt(0)

    // return a zero-width object (null object pattern) if we don't have a range
    if (!range) {
      return {width: 0}
    }

    return range.getBoundingClientRect()
  }

  function areRectsEqual(rect1, rect2) {
    // we don't have lodash or underscore to give us `isEqual`, so roll our own
    return rect1.x == rect2.x &&
      rect1.y == rect2.y &&
      rect1.width == rect2.width &&
      rect1.height == rect2.height
  }

  function showTooltip() {
    if (window.tooltipPopper) {
      // if there is already a tooltip currently shown; no action needed
      return
    }

    const tooltipElement = initializeTooltipElement()
    createTooltipPopper(tooltipElement)
  }

  function initializeTooltipElement() {
    // The tooltip element always exists; it is shown or hidden based on tooltip state

    const selectionString = document.getSelection().toString()
    // build and update the tweet link href
    const tweetHref = buildTweetHref(selectionString)
    document.querySelector('.highlight-tooltip-link-tweet').setAttribute('href', tweetHref)

    // build and update the edit link href
    const editHref = buildEditHref()
    document.querySelector('.highlight-tooltip-link-edit').setAttribute('href', editHref)

    // build and update the web ide link href
    const webIdeHref = buildWebIdeHref()
    document.querySelector('.highlight-tooltip-link-web-ide').setAttribute('href', webIdeHref)

    // find the tooltip element and show it
    const tooltipElement = document.querySelector('#highlight-tooltip')
    tooltipElement.setAttribute('data-show', '')

    return tooltipElement
  }

  function createTooltipPopper(tooltipElement) {
    // a new popper instance is created and destroyed for each new selection
    const virtualElement = {
      getBoundingClientRect: () => (getBoundingClientRect()),
    }

    const navbarHeight = 58 // Should be the same as $navbar-height in CSS
    const popperModifiers = [
      {
        name: 'offset',
        options: {
          offset: [0, 8],
        },
      },
      {
        name: 'flip',
        options: {
          padding: { top: navbarHeight},
        },
      },
    ]

    const popperOptions = {
      placement: 'top',
      modifiers: popperModifiers,
    }

    const tooltipPopper = createPopper(
      virtualElement,
      tooltipElement,
      popperOptions
    )

    // store the currentBoundingClientRect on the popper, we will use it later
    tooltipPopper.currentBoundingClientRect = getBoundingClientRect()

    // store the popper on the window, it serves as a flag to know if we
    // currently have a tooltip existing or not
    window.tooltipPopper = tooltipPopper
  }

  function hideTooltip() {
    if (!window.tooltipPopper) {
      // there is no tooltip currently shown; no action needed
      return
    }

    // hide the popper element
    const tooltipElement = window.tooltipPopper.state.elements.popper
    tooltipElement.removeAttribute('data-show')
    // "destroy" the popper instance by unreferencing it
    window.tooltipPopper = undefined
  }
};
