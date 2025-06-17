class Photon < Formula
  desc "Lightning-fast terminal research tool"
  homepage "https://github.com/Jacky040124/photon"
  version "0.1.1"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Jacky040124/photon/releases/download/v0.1.1/ptn-darwin-arm64"
    sha256 "524276d110475df1f2ea739247ff856d1e73e22a952867442ea809eaa6df9ad1"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Jacky040124/photon/releases/download/v0.1.1/ptn-darwin-amd64"
    sha256 "c03672d0357117985a79efb886e0d27a836c51f8ac7fe71853699fd816961e2f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jacky040124/photon/releases/download/v0.1.1/ptn-linux-arm64"
    sha256 "29ad0b6e8d26eb3fb8eee00c1f66e98f07da7e278cbc42cd5b4a5078b6aa5d27"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jacky040124/photon/releases/download/v0.1.1/ptn-linux-amd64"
    sha256 "7d28552e1a84cf89b4235f652e5fb8bf73263e205e74563ac6d5bef088aaeae1"
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