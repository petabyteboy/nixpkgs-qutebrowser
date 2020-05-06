### qutebrowser based on Qt5.14


```
  nix = {
    binaryCachePublicKeys = [ "petabyteboy.cachix.org-1:B3IZzyEnU4q+zV5YdMTjxKQ/Q2bpkbTx/5V5zAr+G3WW4WXZd8GBOxVYrBQPDcLRsMcoKg2B68kXR+w+DxVhzw==" ];
    binaryCaches = [ "https://petabyteboy.cachix.org" ];
  };

  systemPackages = [
    (import (builtins.fetchTarball "https://github.com/petabyteboy/nixpkgs-qutebrowser/archive/master.tar.gz") {})
  ];
```
