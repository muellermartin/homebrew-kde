class Kconfigwidgets < Formula
  desc "Widgets for configuration dialogs"
  homepage "https://github.com/KDE/kconfigwidgets"
  url "https://github.com/KDE/kconfigwidgets/archive/v5.28.0.tar.gz"
  sha256 "6bed22cb925586ef7f0c3d51fec5a236019aa726b3a3ce03344231951b353d61"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-dbus"
  depends_on "kauth"
  depends_on "kcoreaddons"
  depends_on "kcodecs"
  depends_on "kconfig"
  depends_on "kdoctools" => :optional
  depends_on "kguiaddons"
  depends_on "ki18n"
  depends_on "kwidgetsaddons"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test kconfigwidgets`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
