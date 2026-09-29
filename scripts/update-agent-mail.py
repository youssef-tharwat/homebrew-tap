#!/usr/bin/env python3
"""Generate the formula from a fully published Agent Mail release (requires gh)."""
import json
import re
import subprocess
import sys
from pathlib import Path

if len(sys.argv) != 2 or not re.fullmatch(r"v[0-9]+\.[0-9]+\.[0-9]+", sys.argv[1]):
    raise SystemExit("Usage: python3 scripts/update-agent-mail.py vX.Y.Z")
tag = sys.argv[1]
release = json.loads(subprocess.check_output([
    "gh", "release", "view", tag, "--repo", "youssef-tharwat/agent-mail",
    "--json", "tagName,isDraft,isPrerelease,assets",
], text=True))
if release["tagName"] != tag or release["isDraft"] or release["isPrerelease"]:
    raise SystemExit("Only a published stable release can update the tap")
assets = {asset["name"]: asset for asset in release["assets"]}
base = f"https://github.com/youssef-tharwat/agent-mail/releases/download/{tag}"
lines = [
    "class AgentMail < Formula",
    '  desc "Durable tasks and messages for coding agents"',
    '  homepage "https://github.com/youssef-tharwat/agent-mail"',
    f'  version "{tag[1:]}"',
    '  license "MIT"',
]
for os_name, suffix in [("macos", "apple-darwin"), ("linux", "unknown-linux-gnu")]:
    lines += ["", f"  on_{os_name} do"]
    if os_name == "macos":
        lines += ['    depends_on macos: :sonoma', ""]
    for cpu, arch in [("arm", "aarch64"), ("intel", "x86_64")]:
        name = f"agent-mail-{tag}-{arch}-{suffix}.tar.gz"
        asset = assets.get(name)
        digest = asset.get("digest", "") if asset else ""
        if not re.fullmatch(r"sha256:[0-9a-f]{64}", digest):
            raise SystemExit(f"Missing verified release digest for {name}")
        if name + ".sha256" not in assets:
            raise SystemExit(f"Missing checksum file for {name}")
        lines += [f"    on_{cpu} do", f'      url "{base}/{name}"',
                  f'      sha256 "{digest[7:]}"', "    end"]
        if cpu == "arm":
            lines.append("")
    lines.append("  end")
lines += ["", "  def install", '    bin.install "agent-mail"', "  end", "",
          "  test do", '    assert_match version.to_s, shell_output("#{bin}/agent-mail --version")',
          '    system bin/"agent-mail", "--state-dir", testpath/"state", "init", "smoke"',
          '    assert_path_exists testpath/"state/mail.db"', "  end", "end", ""]
root = Path(__file__).resolve().parents[1]
(root / "Formula/agent-mail.rb").write_text("\n".join(lines))
print(f"Updated agent-mail to {tag}; review, run brew tests, then commit and push.")
