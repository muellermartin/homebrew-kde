class Kcompletion < Formula
  desc "Completion framework, including completion-enabled lineedit and combobox"
  homepage "https://github.com/KDE/kcompletion"
  url "https://github.com/KDE/kcompletion/archive/v5.28.0.tar.gz"
  sha256 "0d437e3fb12dce4c978c9104820bfc35cfce5f0cad809f940636f19febe9a24a"

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "kconfig"
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
    # were more thorough. Run the test with `brew test kcompletion`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
