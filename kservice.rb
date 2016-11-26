class Kservice < Formula
  desc "Plugin framework for desktop services"
  homepage "https://github.com/KDE/kservice"
  url "https://github.com/KDE/kservice/archive/v5.28.0.tar.gz"
  sha256 "bee560be18fc91053ffaf5347719d592a14a90434b942c29406aeddf29dd8fb2"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  # bison in macOS is too old (causes build error)
  depends_on "bison" => :build
  depends_on "qt5" => "with-dbus"
  depends_on "kconfig"
  depends_on "kcoreaddons"
  depends_on "kcrash"
  depends_on "kdbusaddons"
  depends_on "ki18n"
  depends_on "kdoctools" => :optional

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test kservice`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
