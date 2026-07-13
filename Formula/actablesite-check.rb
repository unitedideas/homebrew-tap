require "json"

class ActablesiteCheck < Formula
  desc "Check website indexability and AI crawler policy"
  homepage "https://actablesite.com/ai-crawler-github-action"
  url "https://github.com/unitedideas/actablesite-check/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "946b197d4ec764adac7a33b7a59dc7081b6ff63846b9bac40f2e4d166a2e2871"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "bin", "lib", "package.json", "README.md", "LICENSE"
    (bin/"actablesite-check").write_env_script(
      libexec/"bin/actablesite-check.js",
      PATH: Formula["node"].opt_bin,
    )
  end

  test do
    output = shell_output("#{bin}/actablesite-check --starter")
    assert_match "User-agent: OAI-SearchBot", output
    assert_match "User-agent: GPTBot", output
    assert_match "--edge", shell_output("#{bin}/actablesite-check --help")
    json = JSON.parse(shell_output("#{bin}/actablesite-check actablesite.com --json"))
    assert_equal 8, json["crawlers"].length
    assert_equal false, json.dig("indexability", "noindex")
  end
end
