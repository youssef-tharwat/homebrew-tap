class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.9.0"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.9.0/agent-mail-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "3d97198c7fca93f2a4274c04a4e1d047981d24d0320dcac9f3fbeff728a7a535"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.9.0/agent-mail-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "8ca4fda36cf70c71033aba5873bdaee9fc2af411d4d455f436e3e465fbe1bddf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.9.0/agent-mail-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57f59d2dccfaad25cba0195991c4fee59e76872ee3c7c9c2ac504a30a218e8d3"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.9.0/agent-mail-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "446b74d5ffa0bd58f4d00317389624cf0d8aa5e8e574d514991da54b1215ee03"
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
