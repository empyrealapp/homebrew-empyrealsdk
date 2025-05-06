class Empctl < Formula
    desc "A CLI tool from Emp Cloud"
    homepage "https://empyrealsdk.com"
    version "1.0.9"

    if OS.mac? && Hardware::CPU.intel?
      # macOS (Intel)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.8-darwin-amd64.tar.gz"
      sha256 "94a41f6c1ce3e531ecf523c5bc707a9f6205a4662bf8153a613788dd04bb9950"
    elsif OS.mac? && Hardware::CPU.arm?
      # macOS (Apple Silicon)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.8-darwin-arm64.tar.gz"
      sha256 "c0e5385ebc7214968efa062a5fc138fdeec9ddc18ad1c1495ee94f05a9145569"
    elsif OS.linux? && Hardware::CPU.intel?
      # Linux (Intel/AMD 64-bit)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.8-linux-amd64.tar.gz"
      sha256 "e16ac1847f501c91e0302f7d25e27ebd5aa935b4d252c3b8e337a86eb671dab5"
    elsif OS.linux? && Hardware::CPU.arm?
      # Linux (ARM 64, e.g. Graviton)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.8-linux-arm64.tar.gz"
      sha256 "a39be874450d2056762d93801202de4fe036b97af6a5b2ab48fa02b23ece5519"
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
