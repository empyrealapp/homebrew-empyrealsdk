class Empctl < Formula
    desc "A CLI tool from Emp Cloud"
    homepage "https://empyrealsdk.com"
    version "1.0.11"

    if OS.mac? && Hardware::CPU.intel?
      # macOS (Intel)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.11-darwin-amd64.tar.gz"
      sha256 "20befbd4aad3abc9482196b9ba4dfca4f801e55c87773fadf83a3f3b924dd928"
    elsif OS.mac? && Hardware::CPU.arm?
      # macOS (Apple Silicon) 
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.11-darwin-arm64.tar.gz"
      sha256 "73de7e80ff8a484957d66711516bcd2487c7b208b9a848e6d2484db1851bd866"
    elsif OS.linux? && Hardware::CPU.intel?
      # Linux (Intel/AMD 64-bit)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.11-linux-amd64.tar.gz"
      sha256 "766c18dc214ccfa5c245e0efc0d0d8818d69d14a96efcc3d8e1ebeed8f64254b"
    elsif OS.linux? && Hardware::CPU.arm?
      # Linux (ARM 64, e.g. Graviton)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.11-linux-arm64.tar.gz"
      sha256 "6b4ea9e95967b067d1f0ac9e42985b01f6b5d0ccbe47522246c84f2f57c0968a"
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
