class OsinfoDb < Formula
  desc "Libosinfo database files"
  homepage "https://libosinfo.org/"
  #url "https://releases.pagure.org/libosinfo/osinfo-db-20210426.tar.xz"
  #sha256 "66c93b4a5b319b2ff7d40360d9e94486a9a45f2c0dd1c30d4b31de4f223070d0"
  url "https://releases.pagure.org/libosinfo/osinfo-db-20211216.tar.xz"
  sha256 "09ece7b0e521330e31d12a59171e34f097181a7cbbcd6f8cd49f928923bb1082"

  depends_on "osinfo-db-tools" => :build

  def install
    system "osinfo-db-import", "--local", cached_download

    # Copy the archive into the prefix to avoid empty installation error
    cp_r "./", prefix
  end

  test do
    system "osinfo-db-validate", "--local"
  end
end
