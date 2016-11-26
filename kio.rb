class Kio < Formula
  desc "Network transparent access to files and data"
  homepage "https://github.com/KDE/kio"
  url "https://github.com/KDE/kio/archive/v5.28.0.tar.gz"
  sha256 "8442e0fc64fe9866fbc4ee9ea00231920cdcc4d95bbf1a74cb1ac393dd11eb6a"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-dbus"
  depends_on "karchive"
  depends_on "kconfig"
  depends_on "kcoreaddons"
  depends_on "kdbusaddons"
  depends_on "ki18n"
  depends_on "kservice"
  depends_on "kdoctools" => :optional
  depends_on "muellermartin/kde/solid"
  depends_on "kjobwidgets"

  if not build.with? "kiocore-only"
    depends_on "kbookmarks"
    depends_on "kcompletion"
    depends_on "kconfigwidgets"
    depends_on "kiconthemes"
    depends_on "kitemviews"
    depends_on "kwallet"
    depends_on "knotifications"
    depends_on "kwidgetsaddons"
    depends_on "kwindowsystem"
  end

  option "with-kiocore-only", "Only compile KIOCore, not KIOWidgets or anything that depends on it"

  def install
    args = std_cmake_args

    args << "-DKIOCORE_ONLY=ON" if build.with? "kiocore-only"

    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test kio`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
