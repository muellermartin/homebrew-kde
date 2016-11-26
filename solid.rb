class Solid < Formula
  desc "Desktop hardware abstraction"
  homepage "https://github.com/KDE/solid"
  url "https://github.com/KDE/solid/archive/v5.28.0.tar.gz"
  sha256 "22f78cd58621bacf4c6aeae36aa45abf37c5e515a2978612a74a1e56190eed48"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  # bison in macOS is too old (causes build error)
  depends_on "bison" => :build
  depends_on "qt5" => "with-dbus"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test solid`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
