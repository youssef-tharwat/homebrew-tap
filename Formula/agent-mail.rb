class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.14.2"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.14.2/agent-mail-v0.14.2-aarch64-apple-darwin.tar.gz"
      sha256 "8bc02c620f495058b16158e66bf12817c496212451e24abe6b6ad946a4461f27"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.14.2/agent-mail-v0.14.2-x86_64-apple-darwin.tar.gz"
      sha256 "e919180bbfd249b4bbf9632d6d6635b9faf060f2dc30e772ae83b45d453a88f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.14.2/agent-mail-v0.14.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0e04f626e2c5c061108b1347d018577672848a8aa4edb65d309d0d6d1d07d7d"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.14.2/agent-mail-v0.14.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4da7be958434544dd3eec9af08e3972ec264071c12a2be175e65893ced575863"
    end
  end

  def install
    bin.install "agent-mail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-mail --version")
    system bin/"agent-mail", "--state-dir", testpath/"state", "init", "smoke"
    assert_path_exists testpath/"state/mail.db"
    assert_match "# Agent Mail", shell_output("#{bin}/agent-mail --skill")
  end
end
