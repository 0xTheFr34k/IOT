{ pkgs, lib, config, inputs, ... }:

{
  #socat tcp-listen:2222,fork exec:'/mnt/c/socat/socat.exe - tcp\:localhost\:2222' &  
  dotenv.enable = true;

  packages = [
    pkgs.git
    # pkgs.socat
  ];
}

