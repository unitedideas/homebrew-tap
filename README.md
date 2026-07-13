# Homebrew tap for ActableSite

Install the dependency-free AI crawler policy checker:

```bash
brew install unitedideas/tap/actablesite-check
```

Then check a public website:

```bash
actablesite-check example.com
```

The formula is pinned to the signed-off [`actablesite-check` v1.3.0 release](https://github.com/unitedideas/actablesite-check/releases/tag/v1.3.0). The checker reports robots.txt policy for eight OpenAI, Anthropic, Perplexity, and Google AI crawler tokens.

For ongoing checks, [Crawler Watch](https://actablesite.com/crawler-watch?utm_source=github&utm_medium=homebrew-tap&utm_campaign=crawler-watch) monitors one public website every 15 minutes and emails only after a changed state appears twice. It also checks external homepage responses, `sitemap.xml`, and `llms.txt`. The plan is $9/month; synthetic checks do not prove provider identity, indexing, citation, ranking, or traffic.

## Update policy

Each formula update must pin a published release archive, update its SHA-256, and pass the macOS install-and-run workflow before merge.
