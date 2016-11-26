class Kbookmarks < Formula
  desc "Bookmarks management library"
  homepage "https://github.com/KDE/kbookmarks"
  url "https://github.com/KDE/kbookmarks/archive/v5.28.0.tar.gz"
  sha256 "bb0ba84ff4b4794e13efeeda6469e43c2eff4a3b005a62e0f78e0b6be2e9acc9"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "kconfig"
  depends_on "kcoreaddons"
  depends_on "kcodecs"
  depends_on "kconfigwidgets"
  depends_on "kiconthemes"
  depends_on "kwidgetsaddons"
  depends_on "kxmlgui"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test kbookmarks`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
