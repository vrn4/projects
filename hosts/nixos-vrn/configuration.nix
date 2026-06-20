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

	time.timeZone = "Asia/Yekaterinburg";

	i18n.defaultLocale = "en_US.UTF-8";
	i18n.supportedLocales = [
		"en_US.UTF-8/UTF-8"
		"ru_RU.UTF-8/UTF-8"
	];

	services.printing = {
		enable = true;
		drivers = [
			pkgs.gutenprint
			pkgs.hplip
			pkgs.hplipWithPlugin
			pkgs.samsung-unified-linux-driver
		];
	};

	services.displayManager.sddm.enable = true;
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

	users.users.vrn = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" ];
#		initialPassword = "nixos";
	};

	nixpkgs.config.allowUnfree = true;
	services.xserver.videoDrivers = [ "nvidia" ];
	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};
	hardware.nvidia = {
		modesetting.enable = true;
		open = false;
		nvidiaSettings = true;
		powerManagement.enable = true;
	};

        nix.settings.experimental-features = [ "nix-command" "flakes" ];

	environment.systemPackages = with pkgs; [
		fastfetch
		git
		curl
		wget
		firefox
		neovim
		libreoffice-fresh
		discord
		steam
		google-chrome
		spotify
 	];
	system.stateVersion = "26.05";
}
