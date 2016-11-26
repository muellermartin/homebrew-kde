class Kconfig < Formula
  desc "Persistent platform-independent application settings"
  homepage "https://github.com/KDE/kconfig"
  url "https://github.com/KDE/kconfig/archive/v5.28.0.tar.gz"
  sha256 "f5584d31861809addf37832e44f5ff66595e23a51739426df113ba3fe418ac9b"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "kauth"
  depends_on "kcoreaddons"
  depends_on "kcodecs"
  depends_on "kconfig"
  depends_on "kdoctools"
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
    # were more thorough. Run the test with `brew test kconfig`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
