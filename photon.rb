class Photon < Formula
  desc "Lightning-fast terminal research tool"
  homepage "https://github.com/Jacky040124/photon"
  version "0.1.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Jacky040124/photon/releases/download/v0.1.0/ptn-darwin-arm64"
    sha256 "b00a9b08175e96373be10a16d78fe8e73ab16250d799913d6c18a3b1731674ab"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Jacky040124/photon/releases/download/v0.1.0/ptn-darwin-amd64"
    sha256 "440f4d1d0956b12f9ab5165e8196aa4159acff70c2bd14052c15167a20304bbd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jacky040124/photon/releases/download/v0.1.0/ptn-linux-arm64"
    sha256 "5472b9e1628813dac289d3a4963f9b230c6be5ff4cd02e7f6d205c02c8f41043"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jacky040124/photon/releases/download/v0.1.0/ptn-linux-amd64"
    sha256 "1b14c15f106cf1029e45c8c2b3a103fb7ac9af27b353c33a8180bf920f620ad9"
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