
{ config, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.kernel.sysctl = {
		"net.ipv6.conf.all.disable_ipv6" = 1;
		"net.ipv6.conf.default.disable_ipv6" = 1;
	};

	networking.hostName = "nixos-vrn";
        services.dnsmasq.enable = true;
	networking.networkmanager.enable = true;

	services.printing = {
		enable = true;
		drivers = [
			pkgs.gutenprint
			pkgs.hplip
			pkgs.hplipWithPlugin
			pkgs.samsung-unified-linux-driver
		];
	};
	services.displayManager.sddm = {
		enable = true;
		wayland.enable = true;
	};	
	services.displayManager.autoLogin = {
			enable = true;
			user = "vrn";
	};

	services.displayManager.defaultSession = "plasma";

	services.desktopManager.plasma6.enable = true;

	services.xserver.xkb = {
		layout = "us,ru";
		variant = "";
		options = "grp:alt_shift_toggle";
	};

	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	nixpkgs.config.allowUnfree = true;

	services.flatpak.enable = true;
	environment.systemPackages = with pkgs; [
		git
		curl
		wget
		alacritty
 		niri
	];
	system.stateVersion = "26.05";
}
