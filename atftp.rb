class Atftp < Formula
  desc "Advanced TFTP client and server"
  homepage "https://sourceforge.net/projects/atftp/"
  url "https://downloads.sourceforge.net/project/atftp/atftp-0.8.0.tar.gz"
  sha256 "df2aa089c7670f9eab40e5598e5d2cb6a582dc5182926ea50b4d690e4e37f316"
  license "GPL-2.0-or-later"
  head "https://git.code.sf.net/p/atftp/code.git", branch: "master"

  livecheck do
    url "https://sourceforge.net/projects/atftp/rss"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pcre2"
  depends_on "readline"

  patch :DATA

  def install
    ENV.append_to_cflags "-isystem #{Formula["readline"].include}"
    ENV.append_to_cflags "-isystem #{Formula["pcre2"].include}"
    ENV.append_to_cflags "-L#{Formula["readline"].lib}"
    ENV.append_to_cflags "-L#{Formula["pcre2"].lib}"
    system "./autogen.sh"
    system "./configure", "--disable-silent-rules", *std_configure_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test atftp`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end

__END__
diff --git a/tftp_def.c b/tftp_def.c
index fd60bae..4794718 100644
--- a/tftp_def.c
+++ b/tftp_def.c
@@ -137 +137 @@ int print_eng(double value, char *string, int size, char *format)
-inline char *Strncpy(char *to, const char *from, size_t size)
+char *Strncpy(char *to, const char *from, size_t size)
@@ -145,0 +146 @@ inline char *Strncpy(char *to, const char *from, size_t size)
+#if 0 // dead code and a glibc-ism that prevents building on macOS
@@ -182,0 +184 @@ int Gethostbyname(char *addr, struct hostent *host)
+#endif
diff --git a/tftp_file.c b/tftp_file.c
index 163af45..7aa1bb0 100644
--- a/tftp_file.c
+++ b/tftp_file.c
@@ -527,0 +528 @@ int tftp_receive_file(struct client_data *data)
+#ifdef IPV6_ADD_MEMBERSHIP // missing on macOS
@@ -530,0 +532,3 @@ int tftp_receive_file(struct client_data *data)
+#else
+                              err = 0;
+#endif
@@ -632,0 +637 @@ int tftp_receive_file(struct client_data *data)
+#ifdef IPV6_DROP_MEMBERSHIP // missing on macOS
@@ -635,0 +641,3 @@ int tftp_receive_file(struct client_data *data)
+#else
+                         err = 0;
+#endif
diff --git a/tftp_mtftp.c b/tftp_mtftp.c
index dd3ecc5..61d4d97 100644
--- a/tftp_mtftp.c
+++ b/tftp_mtftp.c
@@ -216,0 +217 @@ int tftp_mtftp_receive_file(struct client_data *data)
+#ifdef IPV6_ADD_MEMBERSHIP // missing on macOS
@@ -218,0 +220,3 @@ int tftp_mtftp_receive_file(struct client_data *data)
+#else
+          err = 0;
+#endif
@@ -515,0 +520 @@ int tftp_mtftp_receive_file(struct client_data *data)
+#ifdef IPV6_DROP_MEMBERSHIP // missing on macOS
@@ -518,0 +524,3 @@ int tftp_mtftp_receive_file(struct client_data *data)
+#else
+                    err = 0;
+#endif
