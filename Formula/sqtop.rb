class Sqtop < Formula
  desc "Read-only Slurm schedule explorer over SSH"
  homepage "https://github.com/skim0119/sqtop"
  url "https://github.com/skim0119/sqtop/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "475a7eb801e545a0e8e29b57babd4775c96d4829fea588c0a4109eeb4f9d7207"
  license "MIT"

  depends_on "rust" => :build
  depends_on "openssh"

  deny_network_access!

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sqtop --version")
    assert_match "SSH_HOST", shell_output("#{bin}/sqtop --help")
  end
end
