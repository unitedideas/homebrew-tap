# Homebrew tap for ActableSite

Install the dependency-free website indexability and AI crawler policy checker:

```bash
brew install unitedideas/tap/actablesite-check
```

Then check a public website:

```bash
actablesite-check example.com
```

The formula is pinned to the signed-off [`actablesite-check` v1.5.0 release](https://github.com/unitedideas/actablesite-check/releases/tag/v1.5.0). The checker reports homepage status, robots meta, X-Robots-Tag, canonical, and robots.txt policy for eight OpenAI, Anthropic, Perplexity, and Google AI crawler tokens.

For ongoing checks, [Crawler Watch](https://actablesite.com/crawler-watch?utm_source=github&utm_medium=homebrew-tap&utm_campaign=crawler-watch) monitors one public website every 15 minutes and emails only after a changed state appears twice. It also checks homepage indexability, synthetic crawler responses, `sitemap.xml`, and `llms.txt`. The plan is $9/month; returned HTML, headers, and synthetic requests do not prove provider identity, indexing, citation, ranking, or traffic.

## Update policy

Each formula update must pin a published release archive, update its SHA-256, and pass the macOS install-and-run workflow before merge.
