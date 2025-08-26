class Empctl < Formula
    desc "A CLI tool from Emp Cloud"
    homepage "https://empyrealsdk.com"
    version "1.0.12"

    if OS.mac? && Hardware::CPU.intel?
      # macOS (Intel)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.11-darwin-amd64.tar.gz"
      sha256 "d79d0de16e38799f9c6eed6ff31d3f646458a53ca2b225ee7c0957cc2f2d7db7"
    elsif OS.mac? && Hardware::CPU.arm?
      # macOS (Apple Silicon) 
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.11-darwin-arm64.tar.gz"
      sha256 "0b6866da454510e349bfff16cc5250b9056867792ee9cfc1e7bdbe08c1790471"
    elsif OS.linux? && Hardware::CPU.intel?
      # Linux (Intel/AMD 64-bit)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.11-linux-amd64.tar.gz"
      sha256 "008661801311f1ccb56b7baec26a6f09d963cd61b815f9628785a9f21d6af3c7"
    elsif OS.linux? && Hardware::CPU.arm?
      # Linux (ARM 64, e.g. Graviton)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.11-linux-arm64.tar.gz"
      sha256 "063026d5fd2c041da74f33047ca76511a5d8179cae9ad8bfa896215287170595"
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
