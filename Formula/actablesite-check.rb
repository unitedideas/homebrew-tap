class ActablesiteCheck < Formula
  desc "Check robots.txt policy for major AI crawler tokens"
  homepage "https://actablesite.com/ai-crawler-checker"
  url "https://github.com/unitedideas/actablesite-check/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "645c028fe440696ec1700c5303fae69f7e2a266a8790c1109c33cc4a6e765d5a"
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
