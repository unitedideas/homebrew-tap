class ActablesiteCheck < Formula
  desc "Check AI crawler robots policy and synthetic edge responses"
  homepage "https://actablesite.com/cloudflare-ai-crawler-checker"
  url "https://github.com/unitedideas/actablesite-check/archive/refs/tags/v1.4.2.tar.gz"
  sha256 "f0722b4f26d7eadc337750e12b1d459d6a1813694c50db943dccf6d0b87b5f19"
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
