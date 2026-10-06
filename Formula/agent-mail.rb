class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.12.0"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.12.0/agent-mail-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "639e3a28bb7be1c0e5bcb01ba4974fbf7e214471836f5d197604662e7fc2d6bd"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.12.0/agent-mail-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "8e3c041ce6642eec72a150595dc0e73b6e7740bf2007cf1b23837e1ff3975e66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.12.0/agent-mail-v0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e93a8ed86549b3559f808fff41459ea48e7b612a0fe4e6392012c314f8ddcb2f"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.12.0/agent-mail-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb737e2124ffac789cc2f4a1141211f6e327b59020fdb01453080bdf4a920cb1"
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
