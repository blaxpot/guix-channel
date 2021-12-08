# Installation

Add the following to to `~/.config/guix/channels.scm`:
```
(cons* (channel
        (name 'blaxpot)
        (url "https://github.com/blaxpot/guix-channel.git")
        ;; Enable signature verification:
        (introduction
         (make-channel-introduction
          "95db838d17332905e102cbcc4a57a2824c402153"
          (openpgp-fingerprint
           "72F1 3159 DA81 71F7 F246  B5BB B063 4F93 252E BF15"))))
       %default-channels)
```

Then run `guix pull`

