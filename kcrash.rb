class Kcrash < Formula
  desc "Graceful handling of application crashes"
  homepage "https://github.com/KDE/kcrash"
  url "https://github.com/KDE/kcrash/archive/v5.28.0.tar.gz"
  sha256 "ab138d8f0d5318ea07339c459729fed4381602b421b8413571e334f2e56bd4d1"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "kcoreaddons"
  depends_on "kwindowsystem"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test kcrash`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
