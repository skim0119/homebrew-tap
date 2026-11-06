class Sqtop < Formula
  desc "Read-only Slurm schedule explorer over SSH"
  homepage "https://github.com/skim0119/sqtop"
  url "https://github.com/skim0119/sqtop/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6dd1c1e2147d334ea018c7baba65d7796449891b3975c4fc316fc004f1ef9575"
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
