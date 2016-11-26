class Karchive < Formula
  desc "Qt 5 addon providing access to numerous types of archives"
  homepage "https://github.com/KDE/karchive"
  url "https://github.com/KDE/karchive/archive/v5.28.0.tar.gz"
  sha256 "4c0244832a86f0de2475226db06a1ad074af5c5315a892364f34313776e536a9"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5"

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
    # were more thorough. Run the test with `brew test karchive`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
