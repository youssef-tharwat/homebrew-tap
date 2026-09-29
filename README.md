# Youssef Tharwat's Homebrew tap

Install [Agent Mail](https://github.com/youssef-tharwat/agent-mail), a local CLI
for durable agent messages and tasks:

```sh
brew install youssef-tharwat/tap/agent-mail
npx skills add youssef-tharwat/agent-mail --skill agent-mail -g
```

The Agent Mail skill is required in every participating agent client. The skill
installer uses Node/npm; [manual installation](https://github.com/youssef-tharwat/agent-mail/blob/main/docs/usage.md#agent-skill)
is also supported. Homebrew installs the CLI.

Uses prebuilt macOS and Linux binaries for ARM64 and x86-64, verified by SHA-256.
No Cargo or Rust compiler is required. macOS requires 14+; Linux requires glibc 2.35 or newer.

## Upgrade

```sh
brew update
brew upgrade youssef-tharwat/tap/agent-mail
```

Follow the [Agent Mail upgrade guide](https://github.com/youssef-tharwat/agent-mail/blob/main/docs/usage.md#upgrading)
when a release changes the database schema. Uninstalling the formula does not
remove Mail state.

## Maintaining the formula

After all four Agent Mail release archives and checksums have been published:

```sh
python3 scripts/update-agent-mail.py v0.5.1
brew style Formula/agent-mail.rb
brew install youssef-tharwat/tap/agent-mail
brew test youssef-tharwat/tap/agent-mail
```

The updater requires Python 3 and authenticated `gh` for release metadata. It
pins a specific stable release and refuses missing assets or digests. Review the
formula diff, commit it and push. CI exercises installation on all four platforms.
There is no cross-repository publishing token or unattended formula mutation.

MIT licensed.
