class Knotifications < Formula
  desc "Desktop notifications"
  homepage "https://github.com/KDE/knotifications"
  url "https://github.com/KDE/knotifications/archive/v5.28.0.tar.gz"
  sha256 "cf3c5ea659f499d6993a7268f83c0fd9bd7fc4f15bfcf795e0bcc8031e9e1365"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-dbus"
  depends_on "kwindowsystem"
  depends_on "kconfig"
  depends_on "kcodecs"
  depends_on "kcoreaddons"
  depends_on "phonon4qt5"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test knotifications`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
