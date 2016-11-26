class Kitemviews < Formula
  desc "Set of item views extending the Qt model-view framework"
  homepage "https://github.com/KDE/kitemviews"
  url "https://github.com/KDE/kitemviews/archive/v5.28.0.tar.gz"
  sha256 "32b7c933ced13d54dc8491fcb1f1545cf1fc1ccc247ccf2377120fe8c8562542"

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
    # were more thorough. Run the test with `brew test kitemviews`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
