class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.6.0"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.6.0/agent-mail-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "4b6e50a5a530e70c9e316543240f15f7aa46d9bcd8dc15a17b991039b5588ecf"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.6.0/agent-mail-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "feb34b70da2a61e3e3e4a393a0dc786bfa0e7129f2c907e89cc797e49fdc2375"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.6.0/agent-mail-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f5e45a4a72ebf75e9dcdd99446751cf70b14eee6768b737c5689ba5b394a97ef"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.6.0/agent-mail-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b27e76d43bb5d3af85c1a85678421ca049ae6671a5226bb474fc06a2fc3009f"
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
