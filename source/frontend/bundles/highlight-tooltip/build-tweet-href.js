function buildTweetHref(rawTweetText) {
  const tweetText = buildTweetText(rawTweetText)
  const locationWithoutAnchor = window.location.href.replace(
    window.location.hash,
    ''
  )
  const tweetUrl = encodeURI(locationWithoutAnchor)
  const tweetHref =
    `https://twitter.com/intent/tweet` +
    `?text=${tweetText}` +
    `%20` +
    `via @gitlab's Handbook` +
    `&url=${tweetUrl}`

  return tweetHref
}

function buildTweetText(rawTweetText) {
  // twitter will ellipsify, but no need to send more than max - link width...
  const maxTextLength = 265
  // max length of 265 is a guess at whether ellipses will be needed or not
  // after twitter trims text and adds link
  const maybeEllipses = rawTweetText.length > maxTextLength ? '...' : ''
  const trimmedRawTweetText = rawTweetText.substring(0, maxTextLength)
  // twitter knows to preserve trailing ellipses and quote
  const tweetText = encodeURI(`"${trimmedRawTweetText}${maybeEllipses}"`)

  return tweetText
}

export default buildTweetHref
