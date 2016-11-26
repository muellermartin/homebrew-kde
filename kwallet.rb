class Kwallet < Formula
  desc "Safe desktop-wide storage for passwords"
  homepage "https://github.com/KDE/kwallet"
  url "https://github.com/KDE/kwallet/archive/v5.27.0.tar.gz"
  sha256 "9f28bdd5f9758746cb494cc0f48838ca8918860bb504652020e8d43bc935682d"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "kcoreaddons"
  depends_on "kconfig"
  depends_on "kwindowsystem"
  depends_on "ki18n"
  depends_on "kdoctools" => :optional

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test kwallet`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
