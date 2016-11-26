class Knotifyconfig < Formula
  desc "Configuration dialog for desktop notifications"
  homepage "https://github.com/KDE/knotifyconfig"
  url "https://github.com/KDE/knotifyconfig/archive/v5.28.0.tar.gz"
  sha256 "8efe02d25d9218359268745b2d231c231a472f1171edc5118c61a9d57c7cb2d3"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-dbus"
  depends_on "phonon4qt5"
  depends_on "kcompletion"
  depends_on "kconfig"
  depends_on "ki18n"
  depends_on "kio"
  depends_on "knotifyconfig"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test knotifyconfig`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
