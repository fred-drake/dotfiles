module.exports = {
  handlers: [
    {
      match: finicky.matchDomains("open.spotify.com"),
      browser: "Spotify"
    },
    {
      match: /theoremco.slack.com/,
      browser: "Google Chrome"
    },
    {
      match: /miro.com/,
      browser: "Miro"
    },
    {
      match: /theoremco.slack.com/,
      browser: "Safari"
    },
    {
      match: /calendar.google.com/,
      browser: "Safari"
    },
    {
      match: /theoremone.okta.com/,
      browser: "Safari"
    },
    {
      match: /apple.com/,
      browser: "Safari"
    },
    {
      match: /a4502581.slack.com/,
      browser: "Safari"
    },
    {
      match: /apple.enterprise.slack.com/,
      browser: "Safari"
    },
    {
      match: /apple.slack.com/,
      browser: "Safari"
    },
  ],
  defaultBrowser: "Google Chrome"
}
