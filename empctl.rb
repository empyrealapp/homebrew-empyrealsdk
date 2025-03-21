class Empctl < Formula
    desc "A CLI tool from Emp Cloud"
    homepage "https://empyrealsdk.com"
    version "1.0.2"

    if OS.mac? && Hardware::CPU.intel?
      # macOS (Intel)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.2-darwin-amd64.tar.gz"
      sha256 "797a9a554821e6923e4be9785a1d0f35db8cef9a12b9400016ee4b35dd5ad1f5"
    elsif OS.mac? && Hardware::CPU.arm?
      # macOS (Apple Silicon)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.2-darwin-arm64.tar.gz"
      sha256 "042e923c56c5bd6b5830e6271ba3edf920c976dc9b1aa0ba8faf0b188b903479"
    elsif OS.linux? && Hardware::CPU.intel?
      # Linux (Intel/AMD 64-bit)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.2-linux-amd64.tar.gz"
      sha256 "f9c82f7b8a33951761f77a658e72e2f59d29e923276700ba9800f8d565ca1f7e"
    elsif OS.linux? && Hardware::CPU.arm?
      # Linux (ARM 64, e.g. Graviton)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.2-linux-arm64.tar.gz"
      sha256 "8ded7844b355eaedb8bd0bf4c6142b6e7bf734182a7111f98877b243c2d44099"
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
