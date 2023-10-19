module.exports = {
  handlers: [
    {
      match: finicky.matchDomains("open.spotify.com"),
      browser: "Spotify",
    },
    {
      match: /theoremco.slack.com/,
      browser: "Thorium",
    },
    {
      match: /meet.google.com/,
      browser: "Thorium",
    },
    {
      match: /docs.google.com/,
      browser: "Thorium",
    },
    {
      match: /calendar.google.com/,
      browser: "Thorium",
    },
    {
      match: /notion.so\/theoremone/,
      browser: "Thorium",
    },
    {
      match: /theoremone.okta.com/,
      browser: "Thorium",
    },
    {
      match: /theoremone.namely.com/,
      browser: "Thorium",
    },
    {
      match: /theoremco.atlassian.net/,
      browser: "Thorium",
    },
    {
      match: /abacus.com/,
      browser: "Thorium",
    },
    {
      match: /officevibe.com/,
      browser: "Thorium",
    },
    {
      match: /hire.lever.co/,
      browser: "Thorium",
    },
    {
      match: /linktr.ee\/TheoremOneTA/,
      browser: "Thorium",
    },
    {
      match: /theoremone.*?/,
      browser: "Thorium",
    },
    {
      match: /miro.com/,
      browser: "Thorium",
    },
    {
      match: /ro.am/,
      browser: "Thorium",
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
