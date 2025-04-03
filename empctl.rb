class Empctl < Formula
    desc "A CLI tool from Emp Cloud"
    homepage "https://empyrealsdk.com"
    version "1.0.4"

    if OS.mac? && Hardware::CPU.intel?
      # macOS (Intel)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.4-darwin-amd64.tar.gz"
      sha256 "ee0fa8bf30dcb8577801fdb3f42989b776c20728e0aae2bd37cbd59eebf22f88"
    elsif OS.mac? && Hardware::CPU.arm?
      # macOS (Apple Silicon)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.4-darwin-arm64.tar.gz"
      sha256 "248f3839b87db6bbbafe727f45b3945cd91e23dbe77cacb457f0beb2ae82d697"
    elsif OS.linux? && Hardware::CPU.intel?
      # Linux (Intel/AMD 64-bit)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.4-linux-amd64.tar.gz"
      sha256 "f77fe400bced628c2b66cd53f9542fa421875e5355092be5e8bcc505bda61f3d"
    elsif OS.linux? && Hardware::CPU.arm?
      # Linux (ARM 64, e.g. Graviton)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.4-linux-arm64.tar.gz"
      sha256 "a9e0eae8369e52b8f3a978d31001bb1ced3b9a1dc36b7ae601c9714fb567d23c"
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
