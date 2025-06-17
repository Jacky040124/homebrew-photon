class Photon < Formula
  desc "Lightning-fast terminal research tool"
  homepage "https://github.com/Jacky040124/photon"
  version "0.1.1"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Jacky040124/photon/releases/download/v0.1.1/ptn-darwin-arm64"
    sha256 "b536b1c1d6818b3d0376bc87694e1c26604bf89d772f8540f01b76bc387b6f79"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Jacky040124/photon/releases/download/v0.1.1/ptn-darwin-amd64"
    sha256 "91a4df56a1388a5f63aae0328e9ad30b3722410074e9323d0880b73f033cb135"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jacky040124/photon/releases/download/v0.1.1/ptn-linux-arm64"
    sha256 "ed6e0670bbe66b296a489e6b727a5d887ce85b98b7147f59bc2cdb727dcaeff6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jacky040124/photon/releases/download/v0.1.1/ptn-linux-amd64"
    sha256 "046f49e4f77332a502d27f24710ddc63fcee3df950bc24ec700204e4c7325ca6"
  end

  def install
    bin.install Dir["ptn-*"].first => "ptn"
  end

  def caveats
    <<~EOS
      Before using ptn, set your OpenRouter API key:
        export PHOTON_OPEN_ROUTER_KEY="your-api-key"
      
      Get a free API key at: https://openrouter.ai
    EOS
  end

  test do
    # Test that the binary runs
    system "#{bin}/ptn", "--help"
  end
end