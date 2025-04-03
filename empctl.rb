class Empctl < Formula
    desc "A CLI tool from Emp Cloud"
    homepage "https://empyrealsdk.com"
    version "1.0.3"

    if OS.mac? && Hardware::CPU.intel?
      # macOS (Intel)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.3-darwin-amd64.tar.gz"
      sha256 "059e8bc337ac3d82d4bffeb437ec13eab395da8362cbf3f7cd5e420849b1b8d7"
    elsif OS.mac? && Hardware::CPU.arm?
      # macOS (Apple Silicon)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.3-darwin-arm64.tar.gz"
      sha256 "bcd5a5b0c3d757e340dfe201068781b62d8e58b8cf2d86efea1bb336bf303cb6"
    elsif OS.linux? && Hardware::CPU.intel?
      # Linux (Intel/AMD 64-bit)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.3-linux-amd64.tar.gz"
      sha256 "420ee4686050cc6ca21323c51b7d15f68d977cb51e97ee9522a8348eef9fbe71"
    elsif OS.linux? && Hardware::CPU.arm?
      # Linux (ARM 64, e.g. Graviton)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.3-linux-arm64.tar.gz"
      sha256 "b963c50f8cd207d059d895d790fe6690c21fe57c3a796cffd321d7adeb1f23bd"
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
