class Grummage < Formula
  desc "Interactive terminal frontend to Grype for viewing vulnerability data"
  homepage "https://github.com/popey/grummage"
  url "https://github.com/popey/grummage/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "e96517a0bc633d4c9885d02810122378edc8b995a24f2cd0007bbbaab30f7689"
  license "MIT"

  depends_on "python@3.11"

  include Language::Python::Virtualenv

  resource "textual" do
    url "https://files.pythonhosted.org/packages/source/t/textual/textual-5.3.0.tar.gz"
    sha256 "1b6128b339adef2e298cc23ab4777180443240ece5c232f29b22960efd658d4d"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/source/r/rich/rich-13.9.4.tar.gz"
    sha256 "439594978a49a09530cff7ebc4b5c7103ef57baf48d5ea3184f21d9a2befa098"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/source/t/typing-extensions/typing_extensions-4.14.1.tar.gz"
    sha256 "38b39f4aeeab64884ce9f74c94263ef78f3c22467c8724005483154c26648d36"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/source/p/platformdirs/platformdirs-4.3.6.tar.gz"
    sha256 "357fb2acbc885b0419afd3ce3ed34564c13c9b95c89360cd9563f73aa5e2b907"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/source/m/markdown-it-py/markdown-it-py-3.0.0.tar.gz"
    sha256 "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/source/m/mdurl/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/source/p/pygments/pygments-2.19.2.tar.gz"
    sha256 "636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887"
  end
    
  def install
    python3 = "python3.11"
    venv = virtualenv_create(libexec, python3)

    resources.each do |r|
      venv.pip_install r
    end

    venv.pip_install_and_link buildpath
  end

  test do
    system bin/"grummage", "--help"
  end
end
