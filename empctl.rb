class Empctl < Formula
    desc "A CLI tool from Emp Cloud"
    homepage "https://empyrealsdk.com"
    version "1.0.0"

    if OS.mac? && Hardware::CPU.intel?
      # macOS (Intel)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.0-darwin-amd64.tar.gz"
      sha256 "d45ae79e32185e44f5fd902ea288f29114a6704b1f50feda9ffc693072fdf247"
    elsif OS.mac? && Hardware::CPU.arm?
      # macOS (Apple Silicon)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.0-darwin-arm64.tar.gz"
      sha256 "491cec0af88b283fb7d8490bd9619dbaf42851ff4d853e809fd7af218be518f8"
    elsif OS.linux? && Hardware::CPU.intel?
      # Linux (Intel/AMD 64-bit)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.0-linux-amd64.tar.gz"
      sha256 "adab7f3c6e04081fe4412a6e4fcf5c510e2fad4e83765826e645c99037bba8d2"
    elsif OS.linux? && Hardware::CPU.arm?
      # Linux (ARM 64, e.g. Graviton)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.0-linux-arm64.tar.gz"
      sha256 "eb16dbef34908f39059ab6b85ee44d7886aa09e30e3a52e6c250ef820dd46ad5"
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
