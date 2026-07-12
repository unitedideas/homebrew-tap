# Homebrew tap for ActableSite

Install the dependency-free AI crawler policy checker:

```bash
brew install unitedideas/tap/actablesite-check
```

Then check a public website:

```bash
actablesite-check example.com
```

The formula is pinned to the signed-off [`actablesite-check` v1.1.0 release](https://github.com/unitedideas/actablesite-check/releases/tag/v1.1.0). The checker reports robots.txt policy for eight OpenAI, Anthropic, Perplexity, and Google AI crawler tokens.

## Update policy

Each formula update must pin a published release archive, update its SHA-256, and pass the macOS install-and-run workflow before merge.
