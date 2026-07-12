class ActablesiteCheck < Formula
  desc "Check robots.txt policy for major AI crawler tokens"
  homepage "https://actablesite.com/ai-crawler-checker"
  url "https://github.com/unitedideas/actablesite-check/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "84e530f39ca654b062ca62a7646b1fd2d4fc6d5ac2c3b6c6e25d0fed88644d7a"
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
