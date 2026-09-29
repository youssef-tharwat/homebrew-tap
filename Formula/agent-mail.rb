class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.5.1"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.5.1/agent-mail-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "d131e8bb2f23656fad1cf3ac697deb88748be4f0b3c05331a516db8cd64bb551"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.5.1/agent-mail-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "f9b8366dbb78b0019bb359e1829657c1e8e04d03b90e46d39cd09f70842b69c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.5.1/agent-mail-v0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3da36fdf19ae3c3464b87c4bb857b2db110c8db9da5a69148c60d091600c0d43"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.5.1/agent-mail-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8c4f4d462961926a1b4a38d5d45975bda9755919bba957b1b42ba2c9c5c7d18"
    end
  end

  def install
    bin.install "agent-mail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-mail --version")
    system bin/"agent-mail", "--state-dir", testpath/"state", "init", "smoke"
    assert_path_exists testpath/"state/mail.db"
  end
end
