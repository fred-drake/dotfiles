module.exports = {
  handlers: [
    {
      match: finicky.matchDomains("open.spotify.com"),
      browser: "Spotify",
    },
    {
      match: /theoremco.slack.com/,
      browser: "Google Chrome",
    },
    {
      match: /miro.com/,
      browser: "Miro",
    },
    {
      match: /meet.google.com/,
      browser: "Google Chrome",
    },
    {
      match: /docs.google.com/,
      browser: "Google Chrome",
    },
    {
      match: /calendar.google.com/,
      browser: "Google Chrome",
    },
    {
      match: /notion.so\/theoremone/,
      browser: "Google Chrome",
    },
    {
      match: /theoremone.okta.com/,
      browser: "Google Chrome",
    },
    {
      match: /theoremone.namely.com/,
      browser: "Google Chrome",
    },
    {
      match: /theoremco.atlassian.net/,
      browser: "Google Chrome",
    },
    {
      match: /abacus.com/,
      browser: "Google Chrome",
    },
    {
      match: /officevibe.com/,
      browser: "Google Chrome",
    },
    {
      match: /hire.lever.co/,
      browser: "Google Chrome",
    },
    {
      match: /linktr.ee\/TheoremOneTA/,
      browser: "Google Chrome",
    },
    {
      match: /theoremone.*?/,
      browser: "Google Chrome",
    },
    {
      match: /apple.com/,
      browser: "Safari",
    },
    {
      match: /a4502581.slack.com/,
      browser: "Safari",
    },
    {
      match: /apple.enterprise.slack.com/,
      browser: "Safari",
    },
    {
      match: /apple.slack.com/,
      browser: "Safari",
    },
    {
      match: /apple.box.com/,
      browser: "Safari",
    },
  ],
  defaultBrowser: "Brave Browser",
};
