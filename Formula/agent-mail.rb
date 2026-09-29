class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.4.0"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.4.0/agent-mail-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "92981cd35704f3e16eca621dbe55676275f974e04fcf80510079ba8b197aac68"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.4.0/agent-mail-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "e18c61bc5d5715523fe3eb424289564c14f619c8c61336489a5e01e18eecd41b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.4.0/agent-mail-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a20d2d1edc7726165ab0837e36049acde969853d1af7bee653d324dcddf9c9b"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.4.0/agent-mail-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d8549aab08f0f3e5a81fad826e1043775df886f3ea2341f777fe87c0c41ebc4"
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
