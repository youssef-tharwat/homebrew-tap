class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.7.0"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.7.0/agent-mail-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "64affb3a6982b7ffbef89763c5755a79480cc11059de797f0a70e7242dbfdeb5"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.7.0/agent-mail-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "5aaae51ba606873e082d2b801fd95e40d39134ea43b1df92d717b361a13345e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.7.0/agent-mail-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6cb11d22f9e2da07b507b30c787ababfe2fef5d79ba503872df817cc454bae9"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.7.0/agent-mail-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5a307b4e896ad008e8b8b3bac01d1e1b01bfb84b36f594d9f5f86190126ab86"
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
