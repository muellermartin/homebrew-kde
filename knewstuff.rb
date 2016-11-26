class Knewstuff < Formula
  desc "Framework for downloading and sharing additional application data"
  homepage "https://github.com/KDE/knewstuff"
  url "https://github.com/KDE/knewstuff/archive/v5.28.0.tar.gz"
  sha256 "e17e3a8622f19e6a2448a15e0cde2fbfd8650018967c082fabe967ad637a51a4"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "karchive"
  depends_on "kcompletion"
  depends_on "kconfig"
  depends_on "kcoreaddons"
  depends_on "ki18n"
  depends_on "kiconthemes"
  depends_on "kio"
  depends_on "kitemviews"
  depends_on "kservice"
  depends_on "ktextwidgets"
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
    # were more thorough. Run the test with `brew test knewstuff`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
