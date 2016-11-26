class Kiconthemes < Formula
  desc "Icon GUI utilities"
  homepage "https://github.com/KDE/kiconthemes"
  url "https://github.com/KDE/kiconthemes/archive/v5.28.0.tar.gz"
  sha256 "83837ca4f92f4ccdd0c72c11e9ecefd87ee3dcfbf2f3cfcdc9d86f64577e6200"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-dbus"
  depends_on "karchive"
  depends_on "ki18n"
  depends_on "kcoreaddons"
  depends_on "kconfigwidgets"
  depends_on "kwidgetsaddons"
  depends_on "kitemviews"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test kiconthemes`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
