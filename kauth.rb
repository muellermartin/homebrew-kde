class Kauth < Formula
  desc "Execute actions as privileged user"
  homepage "https://github.com/KDE/kauth"
  url "https://github.com/KDE/kauth/archive/v5.28.0.tar.gz"
  sha256 "297afeb42a3b4c1c2f89dd443c0f57b18f6cd7e80ef040c70daab629183c31f2"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-dbus"
  depends_on "kcoreaddons"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test kauth`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
