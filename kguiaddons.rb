class Kguiaddons < Formula
  desc "Utilities for graphical user interfaces"
  homepage "https://github.com/KDE/kguiaddons"
  url "https://github.com/KDE/kguiaddons/archive/v5.28.0.tar.gz"
  sha256 "1a4b3eb793ff91be216bc9fcfd40c557e3d02920a93d4c3fd9fbcdb10854a945"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test kguiaddons`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
