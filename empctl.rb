class Empctl < Formula
    desc "A CLI tool from Emp Cloud"
    homepage "https://empyrealsdk.com"
    version "1.0.1"

    if OS.mac? && Hardware::CPU.intel?
      # macOS (Intel)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.1-darwin-amd64.tar.gz"
      sha256 "2abd4c6f38ec209151a71dd68177149a0de7832b817848ec54ae1a914e2d58a5"
    elsif OS.mac? && Hardware::CPU.arm?
      # macOS (Apple Silicon)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.1-darwin-arm64.tar.gz"
      sha256 "f60a7dcee720fa351b1114b4d4761093d55f1e96021a256e37195786f38c6dbc"
    elsif OS.linux? && Hardware::CPU.intel?
      # Linux (Intel/AMD 64-bit)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.1-linux-amd64.tar.gz"
      sha256 "f8df364580a60c29b2e60e5a27374ea58246f05514bbf5233ea5b0726020e9d2"
    elsif OS.linux? && Hardware::CPU.arm?
      # Linux (ARM 64, e.g. Graviton)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.1-linux-arm64.tar.gz"
      sha256 "8a84cde43d37ce5a69945b854ca5a48a0572c0e725b3beae9ad680bb12449e77"
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
