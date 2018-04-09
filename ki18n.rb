class Ki18n < Formula
  desc "KDE Gettext-based UI text internationalization"
  homepage "https://github.com/KDE/ki18n"
  url "https://github.com/KDE/ki18n/archive/v5.36.0.tar.gz"
  sha256 "30078616b3ac6576f2d1f1b410bf5e2de6a2285323313dec2e84e17eae0dfb8c"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "intltool"
  depends_on "gettext"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test ki18n`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
