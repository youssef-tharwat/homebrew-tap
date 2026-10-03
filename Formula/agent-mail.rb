class AgentMail < Formula
  desc "Durable tasks and messages for coding agents"
  homepage "https://github.com/youssef-tharwat/agent-mail"
  version "0.11.1"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.11.1/agent-mail-v0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "34d4ee19f6b3557fc9b50173f42023062c35dd7f5405eb4058ee7b93cddf2c28"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.11.1/agent-mail-v0.11.1-x86_64-apple-darwin.tar.gz"
      sha256 "785d1b6d3bed56e361a7e050a17eb3b5f204c911a738f85fa78f6cd1edaaf878"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.11.1/agent-mail-v0.11.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4e53612fb15b69e8de0c3cee3149a8268f80d00da8b2503eced0be59c948241"
    end

    on_intel do
      url "https://github.com/youssef-tharwat/agent-mail/releases/download/v0.11.1/agent-mail-v0.11.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b97bbe2670e75b9148552baf5a6a77da0e6c483a04825eb394d578eeec1112a5"
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
