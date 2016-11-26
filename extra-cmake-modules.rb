class ExtraCmakeModules < Formula
  desc "Extra CMake Modules"
  homepage "https://cgit.kde.org/extra-cmake-modules.git/"
  url "http://download.kde.org/stable/frameworks/5.28/extra-cmake-modules-5.28.0.tar.xz"
  sha256 "acb4294a6456da6d983bb3a314756fcc640f48e57fe42fc5caa9f4b453df46ba"

  depends_on "cmake" => :run
  depends_on "qt5" => :optional
  depends_on "sphinx-doc" => :build

  def install
    args = std_cmake_args

    if build.with? "qt5"
      args << "-DCMAKE_PREFIX_PATH=#{Formula["qt5"].opt_prefix}"
    end

    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    (testpath/"CMakeLists.txt").write("find_package(ECM REQUIRED NO_MODULE)")

    system "cmake", "."
  end
end
