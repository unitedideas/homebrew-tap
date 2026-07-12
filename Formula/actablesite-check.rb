class ActablesiteCheck < Formula
  desc "Check robots.txt policy for major AI crawler tokens"
  homepage "https://actablesite.com/ai-crawler-checker"
  url "https://github.com/unitedideas/actablesite-check/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "38785b8f51469454841b7928281880df269cc15c74dac7662ff969094b838304"
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
