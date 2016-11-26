class ExtraCmakeModules < Formula
  desc "Extra modules and scripts for CMake"
  homepage "https://github.com/KDE/extra-cmake-modules"
  url "https://github.com/KDE/extra-cmake-modules/archive/v5.28.0.tar.gz"
  sha256 "e70f478785be6ab338f4ae2a4c2235ad9f5cb448e5b38aeffde983f10baae431"

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
