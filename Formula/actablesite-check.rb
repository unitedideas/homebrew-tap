class ActablesiteCheck < Formula
  desc "Check AI crawler robots policy and synthetic edge responses"
  homepage "https://actablesite.com/cloudflare-ai-crawler-checker"
  url "https://github.com/unitedideas/actablesite-check/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "8cf65cf2febb88cdf342e17f8b9300f1a6e589800e8e76239ff2b9d076f41999"
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
  end
end
