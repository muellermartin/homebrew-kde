class Ktextwidgets < Formula
  desc "Text editing widgets"
  homepage "https://github.com/KDE/ktextwidgets"
  url "https://github.com/KDE/ktextwidgets/archive/v5.28.0.tar.gz"
  sha256 "e29a70363f20c7e06e12d8fa4ab61307e3a6d3a0fb253ad1e628f048ccdb1af5"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "kcompletion"
  depends_on "kconfig"
  depends_on "kconfigwidgets"
  depends_on "ki18n"
  depends_on "kiconthemes"
  depends_on "kservice"
  depends_on "kwidgetsaddons"
  depends_on "kwindowsystem"
  depends_on "sonnet"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test ktextwidgets`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
