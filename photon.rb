class Photon < Formula
  desc "Lightning-fast terminal research tool"
  homepage "https://github.com/Jacky040124/photon"
  version "0.1.2"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Jacky040124/photon/releases/download/v0.1.2/ptn-darwin-arm64"
    sha256 "c7b5f59c73221abec6a1de8fb8316136ff822cf8df9aafe1469ab2bc52475cf5"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Jacky040124/photon/releases/download/v0.1.2/ptn-darwin-amd64"
    sha256 "ceb30a95b41f2f6fc68c87cf17615b3d9cfafa2ac371ec0a88e5b0b9462d3d5c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jacky040124/photon/releases/download/v0.1.2/ptn-linux-arm64"
    sha256 "68a4440f138c727406f8d2a0061f55c593234bb4327ac277c614dc209144fc8a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jacky040124/photon/releases/download/v0.1.2/ptn-linux-amd64"
    sha256 "61452a469160a922052ddbd17063bdc7f73943a837eb8e5628d7f650b3afc419"
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