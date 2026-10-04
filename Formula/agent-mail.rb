class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.11.2"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.11.2/agent-mail-v0.11.2-aarch64-apple-darwin.tar.gz"
      sha256 "1de35c9db425e299b52d830095674899257eda41b6de8b6df14dfaf612a591ac"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.11.2/agent-mail-v0.11.2-x86_64-apple-darwin.tar.gz"
      sha256 "7ac013abc522c10d3e3096e7dbe0b081798497fa6f2a1f26ba3f82ed4cf4eb57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.11.2/agent-mail-v0.11.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf2a7aa688b1679ed254f0605b74ee0a6651ebbc727ec82f5c5977af01c994a6"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.11.2/agent-mail-v0.11.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "74f37d2b220966c1cb03431c54a9362fc59539a70c3de684273141e27f250bb9"
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
