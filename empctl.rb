class Empctl < Formula
    desc "A CLI tool from Emp Cloud"
    homepage "https://empyrealsdk.com"
    version "1.0.7"

    if OS.mac? && Hardware::CPU.intel?
      # macOS (Intel)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.7-darwin-amd64.tar.gz"
      sha256 "93baad7fee326a2c01923719b34414576c0a05088d5f03ab691ad6f4a9493b03"
    elsif OS.mac? && Hardware::CPU.arm?
      # macOS (Apple Silicon)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.7-darwin-arm64.tar.gz"
      sha256 "80a272b94f1561f48d66e2ad100ac921fd507177b0268259db74e93f1e570090"
    elsif OS.linux? && Hardware::CPU.intel?
      # Linux (Intel/AMD 64-bit)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.7-linux-amd64.tar.gz"
      sha256 "4651a0dd854fac23e0c16b6295232e5e3ac5b0e617286807ec159a1349aec221"
    elsif OS.linux? && Hardware::CPU.arm?
      # Linux (ARM 64, e.g. Graviton)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.7-linux-arm64.tar.gz"
      sha256 "1b1145033601b22f6103397c9d8e35a9fc20c8dc1835626f4b3d00f069168ff3"
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
