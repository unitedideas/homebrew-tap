class ActablesiteCheck < Formula
  desc "Check robots.txt policy for major AI crawler tokens"
  homepage "https://actablesite.com/ai-crawler-checker"
  url "https://github.com/unitedideas/actablesite-check/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "4cdf553c9c43058a6ab5bb584c4c6dcf7e929d0e4c7df6a7d7b28856ba908fae"
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
  end
end
