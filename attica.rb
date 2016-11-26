class Attica < Formula
  desc "Open Collaboration Service client library"
  homepage "https://github.com/KDE/attica"
  url "https://github.com/KDE/attica/archive/v5.28.0.tar.gz"
  sha256 "00381b1ec03bb6573811c489be844bf15c29f7ff0e93b371fd5e285c41f69c53"

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
    # were more thorough. Run the test with `brew test attica`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
