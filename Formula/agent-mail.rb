class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.14.4"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.14.4/agent-mail-v0.14.4-aarch64-apple-darwin.tar.gz"
      sha256 "1c5a6b188f4aab4a9c38979de16ddae1f65369c9eb83d184838a7c5811a0a44a"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.14.4/agent-mail-v0.14.4-x86_64-apple-darwin.tar.gz"
      sha256 "ec5fbcdaca6ca77351da6179deaee3539fe205b251046e3e437b049c44390529"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.14.4/agent-mail-v0.14.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7135ff31498fa969d7f98b888790e27ed85da69574c099104ee92b54245d75ae"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.14.4/agent-mail-v0.14.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "04368b9043d112c6b0e482a3c0046e5eb2b00bf1b2cefa4fd633a2bcdcc83673"
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
