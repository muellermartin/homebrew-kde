class Sonnet < Formula
  desc "Spelling framework for Qt"
  homepage "https://github.com/KDE/sonnet"
  url "https://github.com/KDE/sonnet/archive/v5.28.0.tar.gz"
  sha256 "08a5cd2aabfb2513f09e67d9f7a2569aa642af4456a14902a22f19cb1b070db0"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "aspell" => :optional
  depends_on "encahnt" => :optional
  depends_on "hspell" => :optional
  depends_on "hunspell" => :optional
  depends_on "libvoikko" => :optional

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test sonnet`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
