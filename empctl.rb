class Empctl < Formula
    desc "A CLI tool from Emp Cloud"
    homepage "https://empyrealsdk.com"
    version "1.0.6"

    if OS.mac? && Hardware::CPU.intel?
      # macOS (Intel)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.6-darwin-amd64.tar.gz"
      sha256 "9e58641e32db2ecf9f242b6c05ef96d84463eb210c019d253ba922ae64e0b78d"
    elsif OS.mac? && Hardware::CPU.arm?
      # macOS (Apple Silicon)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.6-darwin-arm64.tar.gz"
      sha256 "15d396bdabd8e1f4a34f3ff43d9767ce9ad86a5b52748d496ce9f74c4746a6a0"
    elsif OS.linux? && Hardware::CPU.intel?
      # Linux (Intel/AMD 64-bit)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.6-linux-amd64.tar.gz"
      sha256 "5fa7a535401ed5e35f2df30dc7a34bbd41b186349b2a80ac117de6a55505758e"
    elsif OS.linux? && Hardware::CPU.arm?
      # Linux (ARM 64, e.g. Graviton)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.6-linux-arm64.tar.gz"
      sha256 "db29a56fbfb0719b9521a867edab5b6be47947b5e1e93ff0ba802c2f585f2b12"
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
