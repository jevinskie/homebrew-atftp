# atftp (Advanced TFTP client and server) Homebrew tap

[atftp SourceForge homepage](https://sourceforge.net/projects/atftp/)</br>
[atftp GitHub mirror](https://github.com/madmartin/atftp)

## Original Author's (Martin Dummer) Blurb

atftp stands for Advanced Trivial File Transfer Protocol. It is called "advanced", by contrast to others TFTP servers, for two reasons. Firstly, it is intended to be fully compliant with all related RFCs. This include RFC1350, RFC2090, RFC2347, RFC2348 and RFC2349. To my knowledge, there is no TFTP server currently available in the public domain that fulfills this requirement. Secondly, atftp is intended for serving boot files to large clusters. It is multi-threaded and support multicast (RFC2090 and PXE), allowing faster boot of hundreds of machine simultaneously.

## How do I install this formula?

`brew install jevinskie/atftp/atftp`

Or `brew tap jevinskie/atftp` and then `brew install atftp`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
