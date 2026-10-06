class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.13.0"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.13.0/agent-mail-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "0df745c2b1854c146f4bd758af0f632762b9f9457481619724b893fe4b0b6d2f"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.13.0/agent-mail-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "2a0175e8ca88947b9d8ee368daa5470c942dc745ac87e585fd0627ba75724dce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.13.0/agent-mail-v0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ad72516abc2dc4dec156d6e5d48001ae4963dc08211a4d5be24462cedad4670"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.13.0/agent-mail-v0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c44330268b619471de9bd356ebb6225b245719c99c57b0a15999588095e7504"
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
