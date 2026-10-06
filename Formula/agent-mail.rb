class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.12.2"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.12.2/agent-mail-v0.12.2-aarch64-apple-darwin.tar.gz"
      sha256 "2938722c42b797b1e967d71170af33bf066a6fdd3351e0cd36f225f783b2f3fb"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.12.2/agent-mail-v0.12.2-x86_64-apple-darwin.tar.gz"
      sha256 "cd0944857c522975d54d18da5d0bb5d7ae601ce89da99d8ce679618b26a27829"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.12.2/agent-mail-v0.12.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a484010f3d533f6998842992a633460261e8f72b077897e8acd85fd906608f76"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.12.2/agent-mail-v0.12.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e4530e77b597a69a474c8edf0db4e2ffa24bd20954fafd280d429fb8deac6cd"
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
