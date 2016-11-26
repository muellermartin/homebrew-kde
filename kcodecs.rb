class Kcodecs < Formula
  desc "String encoding library"
  homepage "https://github.com/KDE/kcodecs"
  url "https://github.com/KDE/kcodecs/archive/v5.28.0.tar.gz"
  sha256 "f85f220b85fdccaa3185e2d98621e587a3ae54952fcb1b898884ef29b4db5998"

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
    # were more thorough. Run the test with `brew test kcodecs`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
