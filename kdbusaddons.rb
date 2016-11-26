class Kdbusaddons < Formula
  desc "Convenience classes for DBus"
  homepage "https://github.com/KDE/kdbusaddons"
  url "https://github.com/KDE/kdbusaddons/archive/v5.28.0.tar.gz"
  sha256 "8ca941d8941a4db5f34d321198be148d5aff24ad77be9cd2d5f999028777a06b"

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
    # were more thorough. Run the test with `brew test kdbusaddons`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
