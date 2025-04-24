class Empctl < Formula
    desc "A CLI tool from Emp Cloud"
    homepage "https://empyrealsdk.com"
    version "1.0.8"

    if OS.mac? && Hardware::CPU.intel?
      # macOS (Intel)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.8-darwin-amd64.tar.gz"
      sha256 "aff3eab3d19ed5e24c71491d3a7702388116285e4425860ffeb4c4e3dcb13636"
    elsif OS.mac? && Hardware::CPU.arm?
      # macOS (Apple Silicon)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.8-darwin-arm64.tar.gz"
      sha256 "badbac8f5c575bddc794db0f9022f525fab2526d740c8e8fb1989430811700d8"
    elsif OS.linux? && Hardware::CPU.intel?
      # Linux (Intel/AMD 64-bit)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.8-linux-amd64.tar.gz"
      sha256 "0c23438610be1481771478b51a3010c45858ae890ca574ac955900787e6c5fad"
    elsif OS.linux? && Hardware::CPU.arm?
      # Linux (ARM 64, e.g. Graviton)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.8-linux-arm64.tar.gz"
      sha256 "2f8d58a2661147796c80272d3a742c2349c2492a3cf07fdd94fb2a610a6294d4"
    else
      odie "Binary not available for this platform."
    end

    def install
      bin.install "empctl"
    end

    test do
      assert_match "Usage", shell_output("#{bin}/empctl --help")
    end
  end
