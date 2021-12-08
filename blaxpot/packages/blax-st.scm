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
          (commit "3ab2acb97a95d7608aec030af836c9d3ad713720")))
        (sha256
          (base32 "1qc7wajz90zgys3p7dfp881wi8rla0q2bk4ycrv81x01y5lc8h5f"))))))

