class P2pNetcat < Formula
  desc "PeerId-addressed netcat-compatible networking utility"
  homepage "https://github.com/santaklouse/go-p2p-netcat"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/santaklouse/go-p2p-netcat/releases/download/v0.7.0/p2p-nc-darwin-arm64.tar.gz"
      sha256 "a4fb1eb78ce561347c4edc8746a2094e40c5c5f0018aafc6c41f245685e014b7"
    else
      url "https://github.com/santaklouse/go-p2p-netcat/releases/download/v0.7.0/p2p-nc-darwin-amd64.tar.gz"
      sha256 "650277e7faaa1c508b05d297196200c17113d290e749fcc37a427cb12b4c1257"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/santaklouse/go-p2p-netcat/releases/download/v0.7.0/p2p-nc-linux-arm64.tar.gz"
      sha256 "87c5bd0d3b2abed7ba281d39667f9d8bbafebd38ecd0bde605f7bb4ca6ca1a24"
    else
      url "https://github.com/santaklouse/go-p2p-netcat/releases/download/v0.7.0/p2p-nc-linux-amd64.tar.gz"
      sha256 "06b700c50543e2867d83006cdcafe021016e1f8277126dec0e14ecfcaeaab5a8"
    end
  end

  def install
    bin.install "p2p-nc"
    bin.install_symlink "p2p-nc" => "pnc"
    bin.install_symlink "p2p-nc" => "p2p-netcat"
  end

  test do
    assert_match "p2p-nc version #{version}", shell_output("#{bin}/p2p-nc --version")
  end
end
