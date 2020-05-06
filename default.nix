{ sources ? import ./nix/sources.nix }:

let
  overlay = self: super: {
    qt514 = self.callPackage ./qt-5/5.14 {};
    qt5 = self.qt514;
    libsForQt514 = super.recurseIntoAttrs (super.lib.makeScope self.qt514.newScope super.mkLibsForQt5);
    libsForQt5 = self.libsForQt514;
    python3 = super.python3.override {
      packageOverrides = python3-self: python3-super: {
        sip = python3-self.callPackage ./sip {};
        pyqt5 = self.libsForQt514.callPackage ./pyqt/5.x.nix { pythonPackages = python3-self; };
        pyqtwebengine = self.libsForQt514.callPackage ./pyqtwebengine { pythonPackages = python3-self; };
      };
    };
  };

  pkgs = import sources.nixpkgs {
    overlays = [ overlay ];
  };

in pkgs.qutebrowser
