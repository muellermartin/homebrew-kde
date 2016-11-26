class Kdoctools < Formula
  desc "tools to generate documentation in various formats from DocBook files"
  homepage "https://github.com/KDE/kdoctools"
  url "https://github.com/KDE/kdoctools/archive/v5.28.0.tar.gz"
  sha256 "36ea7c2b60a96bd40007edf85e994f0de72bfd69161372987f00d032fb02c267"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "karchive"
  depends_on "ki18n" => :optional
  depends_on "docbook"
  depends_on "docbook-xsl"

  def install
      inreplace "cmake/FindDocBookXML4.cmake", "PATHS", "PATHS #{Formula["docbook"].prefix}/docbook/xml/4.5 "
    inreplace "cmake/FindDocBookXSL.cmake", "PATHS", "PATHS #{Formula["docbook-xsl"].prefix}/docbook-xsl "

    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test kdoctools`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
