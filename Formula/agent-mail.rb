class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.9.1"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.9.1/agent-mail-v0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "dde1052e63c2b0fe97be7f6d407a48449fc7fa7a49ed3beec56db24814a93fae"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.9.1/agent-mail-v0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "8cbc0f769fe1ae5a84b7d026caef81af9ce620d1071b483976f7097c2b0d9924"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.9.1/agent-mail-v0.9.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a03a403f5c9bda2d5498e4ff3469bc44bbdf5cee3a19d12a3234a7401517e532"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.9.1/agent-mail-v0.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c2cf6172f7b4820dfd3ff27e8239fca719114365ab350a8820d71be72dcfe5a"
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
