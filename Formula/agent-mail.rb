class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.12.1"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.12.1/agent-mail-v0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "e06dfbec00c562a40db5ccdc41661aea054882ded34c8946621d57d88f93526e"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.12.1/agent-mail-v0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "686bbdbb953d6bffe2f176b3bc86a1512a10f0b781dc745d85e446d51a71a4d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.12.1/agent-mail-v0.12.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2d922c19fc1b0a15e0d85ff02e5ec72d1585e673e9b3027158c5cd1e76300491"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.12.1/agent-mail-v0.12.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2689d809c6ee0c8c5728e90818d48748b0e9221d023fc8133e661aa9eb3e25a"
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
