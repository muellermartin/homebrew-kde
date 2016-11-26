class Kglobalaccel < Formula
  desc "Global desktop keyboard shortcuts"
  homepage "https://github.com/KDE/kglobalaccel"
  url "https://github.com/KDE/kglobalaccel/archive/v5.28.0.tar.gz"
  sha256 "27a1f567765e4650f411e6c34bde2b535bfd8ab30d5d4be4e80918149bff5650"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-dbus"
  depends_on "kconfig"
  depends_on "kcoreaddons"
  depends_on "kcrash"
  depends_on "kdbusaddons"
  depends_on "kwindowsystem"
  depends_on "kservice"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test kglobalaccel`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
