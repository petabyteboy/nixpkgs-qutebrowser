### qutebrowser based on Qt5.14

First add the binary cache to your system configuration, if you have sufficient trust in packages built by me and don't want to build QtWebEngine yourself:

```
  nix = {
    binaryCachePublicKeys = [ "petabyteboy.cachix.org-1:B3IZzyEnU4q+zV5YdMTjxKQ/Q2bpkbTx/5V5zAr+G3WW4WXZd8GBOxVYrBQPDcLRsMcoKg2B68kXR+w+DxVhzw==" ];
    binaryCaches = [ "https://petabyteboy.cachix.org" ];
  };
```

Important: Rebuild your system.
Then, add the new qutebrowser qutebrowser package to your system configuration.

```
  environment.systemPackages = [
    (import (builtins.fetchTarball "https://github.com/petabyteboy/nixpkgs-qutebrowser/archive/master.tar.gz") {})
  ];
```
