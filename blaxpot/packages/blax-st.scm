(define-module (blaxpot packages blax-st)
  #:use-module (gnu packages suckless)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (blaxpot packages))

(define-public blax-st
  (package
    (inherit st)
    (name "blax-st")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/blaxpot/blax-st.git")
          (commit "2f6e597ed871cff91c627850d03152cae5f45779")))
        (sha256
          (base32 "009psvmc77v6hfa96wln0r8vlsi5y4nzs7iv9ws6f98wrdjgv5yh"))))))

