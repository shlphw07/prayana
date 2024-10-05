{
  description = "A Nix Flake based flutter development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          config.android_sdk.accept_license = true;
        };
      in {
        devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              # from pkgs
              flutter
              #jdk11
              #from ./nix/*
              #android.platform-tools
            ];

            #ANDROID_HOME = "${android.androidsdk}/libexec/android-sdk";
            #JAVA_HOME = pkgs.jdk11;
            #ANDROID_AVD_HOME = (toString ./.) + "/.android/avd";
            CHROME_EXECUTABLE = "brave";
          };
      });
}
