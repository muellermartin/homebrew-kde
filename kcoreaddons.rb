class Kcoreaddons < Formula
  desc "Qt addon library with a collection of non-GUI utilities"
  homepage "https://github.com/KDE/kcoreaddons"
  url "https://github.com/KDE/kcoreaddons/archive/v5.28.0.tar.gz"
  sha256 "71a62f7aa4ced3110cac1f37fe09514f33427ecc440f1a110554c80d50d2c1de"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test kcoreaddons`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
