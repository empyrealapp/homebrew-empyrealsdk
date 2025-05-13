class Empctl < Formula
    desc "A CLI tool from Emp Cloud"
    homepage "https://empyrealsdk.com"
    version "1.0.10"

    if OS.mac? && Hardware::CPU.intel?
      # macOS (Intel)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.10-darwin-amd64.tar.gz"
      sha256 "8a7ae1f8b5065ea079f56b6ef109834bbaf484dcb138e00c4457f578681b2b01"
    elsif OS.mac? && Hardware::CPU.arm?
      # macOS (Apple Silicon)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.10-darwin-arm64.tar.gz"
      sha256 "9cd2ec6798fc0b09cb8a654e7305c4240ea0df01962e4ea58dc07608e80fe1d2"
    elsif OS.linux? && Hardware::CPU.intel?
      # Linux (Intel/AMD 64-bit)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.10-linux-amd64.tar.gz"
      sha256 "b335b83c5097d83b3fee0a50af51be1515fa617d5cc88e8e949c2a6ef57f405a"
    elsif OS.linux? && Hardware::CPU.arm?
      # Linux (ARM 64, e.g. Graviton)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.10-linux-arm64.tar.gz"
      sha256 "ac14c723b807f78f483939ba7cf4e1566343a671eb4639826ac2782b68daf56f"
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
