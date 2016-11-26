class Kdenlive < Formula
  desc "KDE Non-LInear Video Editor"
  homepage "https://kdenlive.org/"
  url "https://github.com/KDE/kdenlive/archive/v16.08.2.tar.gz"
  sha256 "8c281561ed3baa26f76337e019d33dd5031a97e4770109634b697217df353387"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-dbus"
  depends_on "mlt"
  depends_on "karchive"
  depends_on "kbookmarks"
  depends_on "kcoreaddons"
  depends_on "kconfig"
  depends_on "kconfigwidgets"
  depends_on "kdbusaddons"
  depends_on "kio"
  depends_on "kwidgetsaddons"
  depends_on "knotifyconfig"
  depends_on "knewstuff"
  depends_on "kxmlgui"
  depends_on "knotifications"
  depends_on "kguiaddons"
  depends_on "ktextwidgets"
  depends_on "kiconthemes"
  depends_on "kcrash"
  depends_on "kfilemetadata"
  depends_on "hicolor-icon-theme"

  def install
    args = std_cmake_args
    args << "-DCMAKE_PREFIX_PATH=#{Formula["qt5"].opt_prefix}"

    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test kdenlive`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
