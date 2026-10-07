class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.14.0"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.14.0/agent-mail-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "d88e4fb00544e4c6e50ca04b4636a6c3238db9610bc42b33a6fa4ce9d2c15795"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.14.0/agent-mail-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "af5b6a24f05271f5c775fd818500aea4779d98564d18b8dda6dc0d495d1ba3af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.14.0/agent-mail-v0.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da0d90f3f3deb02bc48deeac6da8380cca66d902c984044b48ed559e12f9ff89"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.14.0/agent-mail-v0.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f856aba66b1dd3edce0cec701521f6380868c93d42fd3ce959613e1ae61949a5"
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
