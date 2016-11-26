class Kjobwidgets < Formula
  desc "Widgets for showing progress of asynchronous jobs"
  homepage "https://github.com/KDE/kjobwidgets"
  url "https://github.com/KDE/kjobwidgets/archive/v5.28.0.tar.gz"
  sha256 "99bcb8c0cfd17968d3b43fbe5c84f02622289786d6c87befc1e2372c4d6526de"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-dbus"
  depends_on "kcoreaddons"
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
    # were more thorough. Run the test with `brew test kjobwidgets`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
