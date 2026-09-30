class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.10.1"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.10.1/agent-mail-v0.10.1-aarch64-apple-darwin.tar.gz"
      sha256 "8d8019a5daf328167249a66f7020d8de8e9ddad68abebede69355f03c78646c3"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.10.1/agent-mail-v0.10.1-x86_64-apple-darwin.tar.gz"
      sha256 "6714f6445a2d3356de71be4b4e17d3b96f596ff1501fa1d2b17f4003c9e34f0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.10.1/agent-mail-v0.10.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1071efc07e800afcf1626374ad04c4c98438311b455c3f604c137a3389f48455"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.10.1/agent-mail-v0.10.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ff742f1dd7bc8f2c9e1e18d86f368a46dc2e7020a7ff071126287e3e899c3adb"
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
