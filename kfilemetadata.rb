class Kfilemetadata < Formula
  desc "Provides a simple library for extracting text and metadata"
  homepage "https://github.com/KDE/kfilemetadata"
  url "https://github.com/KDE/kfilemetadata/archive/v5.28.0.tar.gz"
  sha256 "ecfaed2b245cbf1329cd2805f04cff32e720c3c2f663b3c6beb4503f3c1b0ddc"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "ki18n"
  depends_on "karchive"
  #depends_on "poppler" => [:optional, "with-qt5"]
  depends_on "taglib" => :optional
  depends_on "exiv2" => :optional
  depends_on "ffmpeg" => :optional
  depends_on "ebook-tools" => :optional

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test kfilemetadata`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
