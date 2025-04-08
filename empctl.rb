class Empctl < Formula
    desc "A CLI tool from Emp Cloud"
    homepage "https://empyrealsdk.com"
    version "1.0.5"

    if OS.mac? && Hardware::CPU.intel?
      # macOS (Intel)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.5-darwin-amd64.tar.gz"
      sha256 "a738c2ccb49eaee549c3eba22767bd5797476d9ac3bc9b7153fd32a77890b619"
    elsif OS.mac? && Hardware::CPU.arm?
      # macOS (Apple Silicon)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.5-darwin-arm64.tar.gz"
      sha256 "bd56c08caae391555c9da0ebe7ec6ea2926ee8a497f6a5634f4716b588f7ad7a"
    elsif OS.linux? && Hardware::CPU.intel?
      # Linux (Intel/AMD 64-bit)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.5-linux-amd64.tar.gz"
      sha256 "973aff16ec82059eb0ea88c583b9a23c15a21aa0170d3ace71c50ad2edede722"
    elsif OS.linux? && Hardware::CPU.arm?
      # Linux (ARM 64, e.g. Graviton)
      url "https://empyrealsdk-binaries.s3.amazonaws.com/empctl-v1.0.5-linux-arm64.tar.gz"
      sha256 "a705220082b700875cd3ccdad9713b759a2ef8fbb27444572f6fbee640247d2a"
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
