class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.8.0"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.8.0/agent-mail-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "e9cb0ab1164bb9eafa69bf4bdce846e36b71eb4632836e136906cbf5c4a68c03"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.8.0/agent-mail-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "e7d5e5598f5e13126061ecb4b8fcc5d98c0059bd08401e6a2f1f640bfc958400"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.8.0/agent-mail-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "02224d81b3f1e98e50ed2355dfca1ad2af9bbf47c12ba46ca4e9dd8304d53a92"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.8.0/agent-mail-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d6fb36ce76cbd00b57fa04ead18b7c3d0bf3fa6033c36a124dbad9221f43ed7b"
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
