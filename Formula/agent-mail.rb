class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.11.0"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.11.0/agent-mail-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "528e854bf34e4bf0eebd21a7634fa6f1c7c54c7378cf293747bd16689865aa7e"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.11.0/agent-mail-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "a942c1c5897f3efb857f050ac6195d3db5515877be55e01be92953eabc35e312"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.11.0/agent-mail-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f53eda65eb172413135a155570cd08d637b60f162e7fe2adcba999871beb4198"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.11.0/agent-mail-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3db9f5a0416bf0587d19b8eee402e439735a080c15c3caad8776ed5d17c43601"
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
