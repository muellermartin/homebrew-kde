class ExtraCmakeModules < Formula
  desc "Extra modules and scripts for CMake"
  homepage "https://github.com/KDE/extra-cmake-modules"
  url "https://github.com/KDE/extra-cmake-modules/archive/v5.36.0.tar.gz"
  sha256 "626df3f4dc7af7c3688377917a9f473f85354fc8ed16c5bb7c99a1f375e54dc9"

  depends_on "sphinx-doc" => :build
  depends_on "cmake"
  depends_on "qt5" => :optional

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
