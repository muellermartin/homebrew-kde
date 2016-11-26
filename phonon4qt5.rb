class Phonon4qt5 < Formula
  desc "The Phonon multimedia library version 4 built against Qt 5"
  homepage "https://github.com/KDE/phonon"
  url "https://github.com/KDE/phonon/archive/v4.9.0.tar.gz"
  sha256 "b65d90505688bea59c2e4c0bf588aab696e183d8fdeb3781699745bbb450a2f0"

  depends_on "cmake" => :build
  depends_on "qt5" => "with-dbus"
  depends_on "pulseaudio" => "with-glib"

  needs :cxx11

  def install
    ENV.cxx11

    args = std_cmake_args

    args << "-DPHONON_BUILD_PHONON4QT5=ON"

    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test phonon`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
