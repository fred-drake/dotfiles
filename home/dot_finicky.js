module.exports = {
  handlers: [
    {
      match: finicky.matchDomains("open.spotify.com"),
      browser: "Spotify",
    },
    {
      match: /theoremco.slack.com/,
      browser: "Brave Browser",
    },
    {
      match: /meet.google.com/,
      browser: "Brave Browser",
    },
    {
      match: /docs.google.com/,
      browser: "Brave Browser",
    },
    {
      match: /calendar.google.com/,
      browser: "Brave Browser",
    },
    {
      match: /notion.so\/theoremone/,
      browser: "Brave Browser",
    },
    {
      match: /theoremone.okta.com/,
      browser: "Brave Browser",
    },
    {
      match: /theoremone.namely.com/,
      browser: "Brave Browser",
    },
    {
      match: /theoremco.atlassian.net/,
      browser: "Brave Browser",
    },
    {
      match: /abacus.com/,
      browser: "Brave Browser",
    },
    {
      match: /officevibe.com/,
      browser: "Brave Browser",
    },
    {
      match: /hire.lever.co/,
      browser: "Brave Browser",
    },
    {
      match: /linktr.ee\/TheoremOneTA/,
      browser: "Brave Browser",
    },
    {
      match: /theoremone.*?/,
      browser: "Brave Browser",
    },
    {
      match: /miro.com/,
      browser: "Brave Browser",
    },
    {
      match: /ro.am/,
      browser: "Brave Browser",
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
  defaultBrowser: "Safari",
};
